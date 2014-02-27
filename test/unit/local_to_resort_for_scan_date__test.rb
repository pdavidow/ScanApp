require 'test_helper'

class LocalToResortForScanDateTest < ActiveSupport::TestCase
  def test_0
    LiftTicket.descendants.each{|each| self.investigate(each)}
  end

  def investigate(ticket_class)
    company = self.example_company
    now  = Time.now.utc
    date = now.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort_1 = company.non_promo_resorts[0]
    non_promo_resort_2 = company.non_promo_resorts[1]
    ticket = ticket_class.new_for_issuer_for_season(company, current_season)

    time = current_season.start_date.to_time.utc
    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(!scan.local_to_resort_for_scan_date?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(!scan.local_to_resort_for_scan_date?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.local_to_resort_for_scan_date?)
  end

  def test_1_day
    company = self.example_company
    now  = Time.now.utc
    date = now.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort_1 = company.non_promo_resorts[0]
    non_promo_resort_2 = company.non_promo_resorts[1]
    promo_resort = company.promo_resorts[0]
    ticket_1 = company.lift_ticket_1_day_for_ski_season(current_season)
    ticket_2 = company.lift_ticket_1_day_for_ski_season(current_season)

    time = current_season.start_date.to_time.utc
    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_1, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_1, time)
    self.assert(!scan.local_to_resort_for_scan_date?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_1, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    ### Now, first perform an invalid scan...

    time = time + 1000
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_2, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_2, time)
    self.assert(scan.local_to_resort_for_scan_date?)

    time = time + 1000
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_2, time)
    self.assert(!scan.local_to_resort_for_scan_date?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_2, time)
    self.assert(scan.local_to_resort_for_scan_date?)
  end
end