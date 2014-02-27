require 'test_helper'

class SatisfyTotalAmountOfConsecutivePotentialUsageDatesTest < ActiveSupport::TestCase
  def test_1
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts.first
    ticket_1_day_promo__A = company.lift_ticket_1_day_promo_for_ski_season(current_season)
    ticket_1_day__A = company.lift_ticket_1_day_for_ski_season(current_season)
    ticket_2_of_3__A = company.lift_ticket_2_of_3_for_ski_season(current_season)
    ticket_3_of_5__A = company.lift_ticket_3_of_5_for_ski_season(current_season)
    ticket_5_of_7__A = company.lift_ticket_5_of_7_for_ski_season(current_season)
    ticket_2_of_3__B = company.lift_ticket_2_of_3_for_ski_season(current_season)
    ticket_3_of_5__B = company.lift_ticket_3_of_5_for_ski_season(current_season)
    ticket_5_of_7__B = company.lift_ticket_5_of_7_for_ski_season(current_season)
    ticket_2_of_3__C = company.lift_ticket_2_of_3_for_ski_season(current_season)
    ticket_3_of_5__C = company.lift_ticket_3_of_5_for_ski_season(current_season)
    ticket_5_of_7__C = company.lift_ticket_5_of_7_for_ski_season(current_season)
    ticket_3_of_5__D = company.lift_ticket_3_of_5_for_ski_season(current_season)
    ticket_5_of_7__D = company.lift_ticket_5_of_7_for_ski_season(current_season)
    ticket_3_of_5__E = company.lift_ticket_3_of_5_for_ski_season(current_season)
    ticket_5_of_7__E = company.lift_ticket_5_of_7_for_ski_season(current_season)
    ticket_3_of_5__F = company.lift_ticket_3_of_5_for_ski_season(current_season)
    ticket_5_of_7__F = company.lift_ticket_5_of_7_for_ski_season(current_season)

    #=================================================== DAY 1
    time = original_time

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__E, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__F, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 2
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 3
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 4
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 5
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 6
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 7
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__E, time)
    self.assert(scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 8
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    #=================================================== DAY 9
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__C, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__D, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__E, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__F, time)
    self.assert(!scan.satisfy_total_amount_of_consecutive_potential_usage_dates?)
  end
end