require 'test_helper'

class ValidForResortTypeAndFrequency__2_of_3__Test < ActiveSupport::TestCase
  def test_1
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    promo_resort_1 = company.promo_resorts[0]
    promo_resort_2 = company.promo_resorts[1]
    non_promo_resort_1 = company.non_promo_resorts[0]
    non_promo_resort_2 = company.non_promo_resorts[1]
    ticket_A = company.ticket_2_of_3
    ticket_A.code = 'ticket_A'
    ticket_A.save
    ticket_B = company.ticket_2_of_3
    ticket_B.code = 'ticket_B'
    ticket_B.save
    ticket_C = company.ticket_2_of_3
    ticket_C.code = 'ticket_C'
    ticket_C.save
    ticket_D = company.ticket_2_of_3
    ticket_D.code = 'ticket_D'
    ticket_D.save

    #=================================================== DAY 1
    time = original_time

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_C = Ticket.find_by_code('ticket_C')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_D = Ticket.find_by_code('ticket_D')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 2
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = promo_resort_2.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 3
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_C = Ticket.find_by_code('ticket_C')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 4
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_C = Ticket.find_by_code('ticket_C')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_C = Ticket.find_by_code('ticket_C')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_D = Ticket.find_by_code('ticket_D')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_D = Ticket.find_by_code('ticket_D')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    #=================================================== DAY 5
    time = time.to_date.advance(days:+1).to_time.utc

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_A = Ticket.find_by_code('ticket_A')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_A, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_B = Ticket.find_by_code('ticket_B')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_B, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_C = Ticket.find_by_code('ticket_C')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_C = Ticket.find_by_code('ticket_C')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_C, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_D = Ticket.find_by_code('ticket_D')
    scan = non_promo_resort_1.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)

    time = time + 1000
    ticket_D = Ticket.find_by_code('ticket_D')
    scan = non_promo_resort_2.scan_lift_ticket_at_timestamp(ticket_D, time)
    self.assert(!scan.valid_for_resort_type_and_frequency?)
  end
end