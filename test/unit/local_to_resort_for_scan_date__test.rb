require 'test_helper'

class LocalToResortForScanDateTest < ActiveSupport::TestCase
  def test_0
    Ticket.descendants.each{|each| self.investigate(each)}
  end

  def investigate(ticket_class)
    company = self.example_company
    now  = Time.now.utc
    date = now.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort_1 = company.non_promo_resorts[0]
    non_promo_resort_2 = company.non_promo_resorts[1]
    ticket = ticket_class.create_for_company(company)
    code = ticket_class.to_s
    ticket.code = code
    ticket.save

    time = current_season.start_date.to_time.utc
    time = time + 1000
    ticket = Ticket.find_by_code(code)
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    ticket = Ticket.find_by_code(code)
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(!scan.local_to_resort_for_scan_date?)

    time = time + 1000
    ticket = Ticket.find_by_code(code)
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    ticket = Ticket.find_by_code(code)
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(!scan.local_to_resort_for_scan_date?)

    time = time + 1000
    ticket = Ticket.find_by_code(code)
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.local_to_resort_for_scan_date?)
  end

  def test_1_day
    company = self.example_company
    now  = Time.now.utc
    date = now.to_date
    #current_season = Season.new(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    current_season.save
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort_1 = company.non_promo_resorts[0]
    non_promo_resort_2 = company.non_promo_resorts[1]
    promo_resort = company.promo_resorts[0]
    ticket_1 = company.ticket_1_day
    ticket_1.code = 'ticket_1'
    ticket_1.save
    ticket_2 = company.ticket_1_day
    ticket_2.code = 'ticket_2'
    ticket_2.save

    time = current_season.start_date.to_time.utc
    time = time + 1000
    ticket_1 = Ticket.find_by_code('ticket_1')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_1, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    ticket_1 = Ticket.find_by_code('ticket_1')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_1, time)
    self.assert(!scan.local_to_resort_for_scan_date?)

    time = time + 1000
    ticket_1 = Ticket.find_by_code('ticket_1')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_1, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    ### Now, first perform an invalid scan...

    time = time + 1000
    ticket_2 = Ticket.find_by_code('ticket_2')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_2, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    ticket_2 = Ticket.find_by_code('ticket_2')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_2, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    ticket_2 = Ticket.find_by_code('ticket_2')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_2, time)
    self.assert(!scan.local_to_resort_for_scan_date?)

    time = time + 1000
    ticket_2 = Ticket.find_by_code('ticket_2')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_2, time)
    self.assert(scan.local_to_resort_for_scan_date?)
  end
end