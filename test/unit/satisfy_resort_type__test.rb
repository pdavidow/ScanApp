require 'test_helper'

class SatisfyResortTypeTest < ActiveSupport::TestCase
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
    ticket_1_day_promo__A = company.ticket_1_day_promo
    ticket_1_day_promo__A.code = 'ticket_1_day_promo__A'
    ticket_1_day_promo__A.save
    ticket_1_day__A = company.ticket_1_day
    ticket_1_day__A.code = 'ticket_1_day__A'
    ticket_1_day__A.save
    ticket_2_of_3__A = company.ticket_2_of_3
    ticket_2_of_3__A.code = 'ticket_2_of_3__A'
    ticket_2_of_3__A.save
    ticket_3_of_5__A = company.ticket_3_of_5
    ticket_3_of_5__A.code = 'ticket_3_of_5__A'
    ticket_3_of_5__A.save
    ticket_5_of_7__A = company.ticket_5_of_7
    ticket_5_of_7__A.code = 'ticket_5_of_7__A'
    ticket_5_of_7__A.save
    ticket_1_day_promo__B = company.ticket_1_day_promo
    ticket_1_day_promo__B.code = 'ticket_1_day_promo__B'
    ticket_1_day_promo__B.save
    ticket_1_day__B = company.ticket_1_day
    ticket_1_day__B.code = 'ticket_1_day__B'
    ticket_1_day__B.save
    ticket_2_of_3__B = company.ticket_2_of_3
    ticket_2_of_3__B.code = 'ticket_2_of_3__B'
    ticket_2_of_3__B.save
    ticket_3_of_5__B = company.ticket_3_of_5
    ticket_3_of_5__B.code = 'ticket_3_of_5__B'
    ticket_3_of_5__B.save
    ticket_5_of_7__B = company.ticket_5_of_7
    ticket_5_of_7__B.code = 'ticket_5_of_7__B'
    ticket_5_of_7__B.save

    #=================================================== DAY 1
    time = original_time

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_1_day_promo__B = Ticket.find_by_code('ticket_1_day_promo__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__B, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_1_day__B = Ticket.find_by_code('ticket_1_day__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(!scan.satisfy_resort_type?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_2_of_3__B = Ticket.find_by_code('ticket_2_of_3__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_resort_type?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_resort_type?)

    #=================================================== DAY 2
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_resort_type?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_resort_type?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_resort_type?)

    #=================================================== DAY 3
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_resort_type?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_resort_type?)

    #=================================================== DAY 4
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_resort_type?)

    #=================================================== DAY 5
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_resort_type?)
  end
end