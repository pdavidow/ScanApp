require 'test_helper'

class SatisfyTotalAmountOfConsecutivePotentialUsageDatesTest < ActiveSupport::TestCase
  def test_1
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
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
    ticket_2_of_3__B = company.ticket_2_of_3
    ticket_2_of_3__B.code = 'ticket_2_of_3__B'
    ticket_2_of_3__B.save
    ticket_3_of_5__B = company.ticket_3_of_5
    ticket_3_of_5__B.code = 'ticket_3_of_5__B'
    ticket_3_of_5__B.save
    ticket_5_of_7__B = company.ticket_5_of_7
    ticket_5_of_7__B.code = 'ticket_5_of_7__B'
    ticket_5_of_7__B.save
    ticket_2_of_3__C = company.ticket_2_of_3
    ticket_2_of_3__C.code = 'ticket_2_of_3__C'
    ticket_2_of_3__C.save
    ticket_3_of_5__C = company.ticket_3_of_5
    ticket_3_of_5__C.code = 'ticket_3_of_5__C'
    ticket_3_of_5__C.save
    ticket_5_of_7__C = company.ticket_5_of_7
    ticket_5_of_7__C.code = 'ticket_5_of_7__C'
    ticket_5_of_7__C.save
    ticket_3_of_5__D = company.ticket_3_of_5
    ticket_3_of_5__D.code = 'ticket_3_of_5__D'
    ticket_3_of_5__D.save
    ticket_5_of_7__D = company.ticket_5_of_7
    ticket_5_of_7__D.code = 'ticket_5_of_7__D'
    ticket_5_of_7__D.save
    ticket_3_of_5__E = company.ticket_3_of_5
    ticket_3_of_5__E.code = 'ticket_3_of_5__E'
    ticket_3_of_5__E.save
    ticket_5_of_7__E = company.ticket_5_of_7
    ticket_5_of_7__E.code = 'ticket_5_of_7__E'
    ticket_5_of_7__E.save
    ticket_3_of_5__F = company.ticket_3_of_5
    ticket_3_of_5__F.code = 'ticket_3_of_5__F'
    ticket_3_of_5__F.save
    ticket_5_of_7__F = company.ticket_5_of_7
    ticket_5_of_7__F.code = 'ticket_5_of_7__F'
    ticket_5_of_7__F.save

    #=================================================== DAY 1
    time = original_time

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__B = Ticket.find_by_code('ticket_2_of_3__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__C = Ticket.find_by_code('ticket_2_of_3__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__C = Ticket.find_by_code('ticket_3_of_5__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__D = Ticket.find_by_code('ticket_3_of_5__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__E = Ticket.find_by_code('ticket_3_of_5__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__F = Ticket.find_by_code('ticket_3_of_5__F')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__C = Ticket.find_by_code('ticket_5_of_7__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__D = Ticket.find_by_code('ticket_5_of_7__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__E = Ticket.find_by_code('ticket_5_of_7__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__E, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__F = Ticket.find_by_code('ticket_5_of_7__F')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__F, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 2
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__C = Ticket.find_by_code('ticket_3_of_5__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 3
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__B = Ticket.find_by_code('ticket_2_of_3__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__C = Ticket.find_by_code('ticket_5_of_7__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 4
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__B = Ticket.find_by_code('ticket_2_of_3__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__C = Ticket.find_by_code('ticket_2_of_3__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__D = Ticket.find_by_code('ticket_3_of_5__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 5
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__B = Ticket.find_by_code('ticket_2_of_3__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__C = Ticket.find_by_code('ticket_2_of_3__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__C = Ticket.find_by_code('ticket_3_of_5__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__D = Ticket.find_by_code('ticket_3_of_5__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__E = Ticket.find_by_code('ticket_3_of_5__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__C = Ticket.find_by_code('ticket_5_of_7__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 6
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__B = Ticket.find_by_code('ticket_2_of_3__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__C = Ticket.find_by_code('ticket_2_of_3__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__C = Ticket.find_by_code('ticket_3_of_5__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__D = Ticket.find_by_code('ticket_3_of_5__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__E = Ticket.find_by_code('ticket_3_of_5__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__F = Ticket.find_by_code('ticket_3_of_5__F')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__D = Ticket.find_by_code('ticket_5_of_7__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 7
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__B = Ticket.find_by_code('ticket_2_of_3__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__C = Ticket.find_by_code('ticket_2_of_3__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__C = Ticket.find_by_code('ticket_3_of_5__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__D = Ticket.find_by_code('ticket_3_of_5__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__E = Ticket.find_by_code('ticket_3_of_5__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__F = Ticket.find_by_code('ticket_3_of_5__F')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__C = Ticket.find_by_code('ticket_5_of_7__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__D = Ticket.find_by_code('ticket_5_of_7__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__E = Ticket.find_by_code('ticket_5_of_7__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__E, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 8
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__B = Ticket.find_by_code('ticket_2_of_3__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__C = Ticket.find_by_code('ticket_2_of_3__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__C = Ticket.find_by_code('ticket_3_of_5__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__D = Ticket.find_by_code('ticket_3_of_5__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__E = Ticket.find_by_code('ticket_3_of_5__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__F = Ticket.find_by_code('ticket_3_of_5__F')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__C = Ticket.find_by_code('ticket_5_of_7__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__D = Ticket.find_by_code('ticket_5_of_7__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__E = Ticket.find_by_code('ticket_5_of_7__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__F = Ticket.find_by_code('ticket_5_of_7__F')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 9
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo__A = Ticket.find_by_code('ticket_1_day_promo__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_1_day__A = Ticket.find_by_code('ticket_1_day__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__A = Ticket.find_by_code('ticket_2_of_3__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__B = Ticket.find_by_code('ticket_2_of_3__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_2_of_3__C = Ticket.find_by_code('ticket_2_of_3__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__A = Ticket.find_by_code('ticket_3_of_5__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__B = Ticket.find_by_code('ticket_3_of_5__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__C = Ticket.find_by_code('ticket_3_of_5__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__D = Ticket.find_by_code('ticket_3_of_5__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__E = Ticket.find_by_code('ticket_3_of_5__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_3_of_5__F = Ticket.find_by_code('ticket_3_of_5__F')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__A = Ticket.find_by_code('ticket_5_of_7__A')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__B = Ticket.find_by_code('ticket_5_of_7__B')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__C = Ticket.find_by_code('ticket_5_of_7__C')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__D = Ticket.find_by_code('ticket_5_of_7__D')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__E = Ticket.find_by_code('ticket_5_of_7__E')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    ticket_5_of_7__F = Ticket.find_by_code('ticket_5_of_7__F')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)
  end
end