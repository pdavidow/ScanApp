require 'test_helper'

class ValidForResortTypeAndFrequency_1Day_Test < ActiveSupport::TestCase
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
    ticket_1_day__A = company.lift_ticket_1_day_for_ski_season(current_season)
    ticket_1_day__B = company.lift_ticket_1_day_for_ski_season(current_season)

    #=================================================== DAY 1
    time = original_time

    time = time + 1000
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 2
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    scan = promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day__B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

  end
end