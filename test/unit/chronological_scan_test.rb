require 'test_helper'

class ChronologicalScanTest < ActiveSupport::TestCase
  include LiftTicketExceptions

  def test_lift_ticket_1_day
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort = company.non_promo_resorts.first
    ticket = company.ticket_1_day
    ticket.save
    ticket = Ticket1Day.first
    ticket.code = 'ticket'
    ticket.save

    time = original_time
    ticket = Ticket.find_by_code('ticket')
    self.assert_nothing_raised(Exception){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}

    time = original_time - 1000
    ticket = Ticket.find_by_code('ticket')
    self.assert_raise(LiftTicketNonChronologicalScanError){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}

    time = original_time - 1
    ticket = Ticket.find_by_code('ticket')
    self.assert_raise(LiftTicketNonChronologicalScanError){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}

    time = original_time
    ticket = Ticket.find_by_code('ticket')
    self.assert_raise(LiftTicketNonChronologicalScanError){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}

    time = original_time + 1
    ticket = Ticket.find_by_code('ticket')
    self.assert_nothing_raised(Exception){non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)}
  end
end