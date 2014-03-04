require 'test_helper'

class ValidForResortTypeAndFrequency_1Day_Test < ActiveSupport::TestCase
  def test_1
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    promo_resort = company.promo_resorts.first
    non_promo_resort = company.non_promo_resorts.first
    ticket_1_day__A = company.ticket_1_day
    ticket_1_day__A.code = 'ticket_1_day__A'
    ticket_1_day__A.save
    ticket_1_day__B = company.ticket_1_day
    ticket_1_day__B.code = 'ticket_1_day__B'
    ticket_1_day__B.save

    #=================================================== DAY 1
    time = original_time

    time = time + 1000
    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_1_day__B = Ticket.find_by_code('ticket_1_day__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_1_day__B = Ticket.find_by_code('ticket_1_day__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 2
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_1_day__B = Ticket.find_by_code('ticket_1_day__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_1_day__B = Ticket.find_by_code('ticket_1_day__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

  end
end