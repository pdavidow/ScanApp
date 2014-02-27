require 'test_helper'

class SatisfyResortTypeTest < ActiveSupport::TestCase
  def test_1
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    promo_resort = company.promo_resorts.first
    non_promo_resort = company.non_promo_resorts.first
    ticket_1_day_promo__A = company.lift_ticket_1_day_promo_for_ski_season(current_season)
    ticket_1_day__A = company.lift_ticket_1_day_for_ski_season(current_season)
    ticket_2_of_3__A = company.lift_ticket_2_of_3_for_ski_season(current_season)
    ticket_3_of_5__A = company.lift_ticket_3_of_5_for_ski_season(current_season)
    ticket_5_of_7__A = company.lift_ticket_5_of_7_for_ski_season(current_season)
    ticket_1_day_promo__B = company.lift_ticket_1_day_promo_for_ski_season(current_season)
    ticket_1_day__B = company.lift_ticket_1_day_for_ski_season(current_season)
    ticket_2_of_3__B = company.lift_ticket_2_of_3_for_ski_season(current_season)
    ticket_3_of_5__B = company.lift_ticket_3_of_5_for_ski_season(current_season)
    ticket_5_of_7__B = company.lift_ticket_5_of_7_for_ski_season(current_season)

    #=================================================== DAY 1
    time = original_time

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo__B, time)
    self.assert(scan.satisfy_resort_type?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(!scan.satisfy_resort_type?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_resort_type?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(scan.satisfy_resort_type?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_resort_type?)

    #=================================================== DAY 2
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3__B, time)
    self.assert(!scan.satisfy_resort_type?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_resort_type?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(scan.satisfy_resort_type?)


    #=================================================== DAY 3
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5__B, time)
    self.assert(!scan.satisfy_resort_type?)

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_resort_type?)



    #=================================================== DAY 4
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_resort_type?)

    #=================================================== DAY 5
    time = time.to_date.advance(days:+1).to_time.utc

    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__A, time)
    self.assert(scan.satisfy_resort_type?)

    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7__B, time)
    self.assert(!scan.satisfy_resort_type?)
  end
end