require 'test_helper'

class SatisfyScanWaitDurationTest < ActiveSupport::TestCase
  def test_0
    Ticket.descendants.each{|each| self.investigate(each)}
  end

  def investigate(ticket_class)
    company = self.example_company
    now = Time.now.utc
    date = now.to_date
    Season.create_for_name_for_start_date_for_end_date('current_season', date.advance(days:-45), date.advance(days:+45))
    current_season = Season.find_by_name('current_season')
    company.season = current_season
    company.save
    company = Company.first

    resort_1 = NonPromoResort.find_by_name('C')
    resort_1.scan_wait_seconds = 60 * 9
    resort_1.save
    resort_1 = NonPromoResort.find_by_name('C')

    resort_2 = NonPromoResort.find_by_name('D')
    resort_2.scan_wait_seconds = 60 * 10
    resort_2.save
    resort_2 = NonPromoResort.find_by_name('D')

    ticket_1 = ticket_class.create_for_company(company)
    ticket_1__code = 'ticket_1' + ticket_class.to_s
    ticket_1.code = ticket_1__code
    ticket_1.save
    ticket_2 = ticket_class.create_for_company(company)
    ticket_2__code = 'ticket_2' + ticket_class.to_s
    ticket_2.code = ticket_2__code
    ticket_2.save

    ticket_1 = Ticket.find_by_code(ticket_1__code)
    resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = now))

    ticket_1 = Ticket.find_by_code(ticket_1__code)
    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    ticket_1 = Ticket.find_by_code(ticket_1__code)
    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    ticket_1 = Ticket.find_by_code(ticket_1__code)
    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    ticket_1 = Ticket.find_by_code(ticket_1__code)
    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 1)))
    self.assert(scan.satisfy_scan_wait_duration?)

    ticket_1 = Ticket.find_by_code(ticket_1__code)
    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 1)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    ticket_1 = Ticket.find_by_code(ticket_1__code)
    scan = resort_1.scan_lift_ticket_at_timestamp(ticket_1, (time = time + (60 * 9)))
    self.assert(scan.satisfy_scan_wait_duration?)

    ######################################################################

    ticket_2 = Ticket.find_by_code(ticket_2__code)
    resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = now))

    ticket_2 = Ticket.find_by_code(ticket_2__code)
    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    ticket_2 = Ticket.find_by_code(ticket_2__code)
    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    ticket_2 = Ticket.find_by_code(ticket_2__code)
    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 3)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    ticket_2 = Ticket.find_by_code(ticket_2__code)
    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 1)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    ticket_2 = Ticket.find_by_code(ticket_2__code)
    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 1)))
    self.assert(scan.satisfy_scan_wait_duration?)

    ticket_2 = Ticket.find_by_code(ticket_2__code)
    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 9)))
    self.assert(!scan.satisfy_scan_wait_duration?)

    ticket_2 = Ticket.find_by_code(ticket_2__code)
    scan = resort_2.scan_lift_ticket_at_timestamp(ticket_2, (time = time + (60 * 2)))
    self.assert(scan.satisfy_scan_wait_duration?)
  end
end