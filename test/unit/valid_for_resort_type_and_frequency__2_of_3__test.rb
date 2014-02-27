require 'test_helper'

class ValidForResortTypeAndFrequency__2_of_3__Test < ActiveSupport::TestCase
  def test_1
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    promo_resort_1 = company.promo_resorts[0]
    promo_resort_2 = company.promo_resorts[1]
    non_promo_resort_1 = company.non_promo_resorts[0]
    non_promo_resort_2 = company.non_promo_resorts[1]
    ticket_A = company.lift_ticket_2_of_3_for_ski_season(current_season)
    ticket_B = company.lift_ticket_2_of_3_for_ski_season(current_season)
    ticket_C = company.lift_ticket_2_of_3_for_ski_season(current_season)
    ticket_D = company.lift_ticket_2_of_3_for_ski_season(current_season)

    #=================================================== DAY 1
    time = original_time

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 2
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    scan = promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = promo_resort_2.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 3
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 4
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 5
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)
  end
end