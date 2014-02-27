require 'test_helper'

class ChronologicalScanTest < ActiveSupport::TestCase
  include LiftTicketExceptions

  def test_lift_ticket_1_day
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts.first
    ticket = company.lift_ticket_1_day_for_ski_season(current_season)

    time = original_time
    self.assert_nothing_raised(Exception){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}

    time = original_time - 1000
    self.assert_raise(LiftTicketNonChronologicalScanError){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}

    time = original_time - 1
    self.assert_raise(LiftTicketNonChronologicalScanError){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}

    time = original_time
    self.assert_raise(LiftTicketNonChronologicalScanError){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}

    time = original_time + 1
    self.assert_nothing_raised(Exception){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}
  end
end