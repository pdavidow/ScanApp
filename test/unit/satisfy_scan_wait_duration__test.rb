require 'test_helper'

class SatisfyScanWaitDurationTest < ActiveSupport::TestCase
  def test_0
    LiftTicket.descendants.each{|each| self.investigate(each)}
  end

  def investigate(ticket_class)
    company = self.example_company
    now = Time.now.utc
    date = now.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    resort_1 = company.non_promo_resorts[0]
    resort_1.scan_wait_seconds = 60 * 9
    resort_2 = company.non_promo_resorts[1]
    resort_2.scan_wait_seconds = 60 * 10
    ticket_1 = ticket_class.new_for_issuer_for_season(company, current_season)
    ticket_2 = ticket_class.new_for_issuer_for_season(company, current_season)

    resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = now))

    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 1)))
    self.assert(scan.satisfy_scan_wait_duration?)

    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 1)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 9)))
    self.assert(scan.satisfy_scan_wait_duration?)

    ######################################################################

    resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = now))

    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 1)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 1)))
    self.assert(scan.satisfy_scan_wait_duration?)

    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 9)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 2)))
    self.assert(scan.satisfy_scan_wait_duration?)
  end
end