require 'test_helper'

class SatisfyAmountMaxUsageDatesTest < ActiveSupport::TestCase
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
    ticket_1_day_promo = company.ticket_1_day_promo
    ticket_1_day_promo.code = 'ticket_1_day_promo'
    ticket_1_day_promo.save
    ticket_1_day = company.ticket_1_day
    ticket_1_day.code = 'ticket_1_day'
    ticket_1_day.save
    ticket_2_of_3 = company.ticket_2_of_3
    ticket_2_of_3.code = 'ticket_2_of_3'
    ticket_2_of_3.save
    ticket_3_of_5 = company.ticket_3_of_5
    ticket_3_of_5.code = 'ticket_3_of_5'
    ticket_3_of_5.save
    ticket_5_of_7 = company.ticket_5_of_7
    ticket_5_of_7.code = 'ticket_5_of_7'
    ticket_5_of_7.save

    #=================================================== DAY 1
    time = original_time

    ticket_1_day_promo = Ticket.find_by_code('ticket_1_day_promo')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    ticket_1_day = Ticket.find_by_code('ticket_1_day')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    ticket_2_of_3 = Ticket.find_by_code('ticket_2_of_3')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    ticket_3_of_5 = Ticket.find_by_code('ticket_3_of_5')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    ticket_5_of_7 = Ticket.find_by_code('ticket_5_of_7')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    #=================================================== DAY 2
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo = Ticket.find_by_code('ticket_1_day_promo')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_1_day = Ticket.find_by_code('ticket_1_day')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_2_of_3 = Ticket.find_by_code('ticket_2_of_3')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    ticket_3_of_5 = Ticket.find_by_code('ticket_3_of_5')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    ticket_5_of_7 = Ticket.find_by_code('ticket_5_of_7')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    #=================================================== DAY 3
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo = Ticket.find_by_code('ticket_1_day_promo')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_1_day = Ticket.find_by_code('ticket_1_day')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_2_of_3 = Ticket.find_by_code('ticket_2_of_3')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_3_of_5 = Ticket.find_by_code('ticket_3_of_5')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    ticket_5_of_7 = Ticket.find_by_code('ticket_5_of_7')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    #=================================================== DAY 4
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo = Ticket.find_by_code('ticket_1_day_promo')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_1_day = Ticket.find_by_code('ticket_1_day')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_2_of_3 = Ticket.find_by_code('ticket_2_of_3')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_3_of_5 = Ticket.find_by_code('ticket_3_of_5')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_5_of_7 = Ticket.find_by_code('ticket_5_of_7')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    #=================================================== DAY 5
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo = Ticket.find_by_code('ticket_1_day_promo')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_1_day = Ticket.find_by_code('ticket_1_day')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_2_of_3 = Ticket.find_by_code('ticket_2_of_3')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_3_of_5 = Ticket.find_by_code('ticket_3_of_5')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_5_of_7 = Ticket.find_by_code('ticket_5_of_7')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7, time)
    self.assert(scan.satisfy_amount_max_usage_dates?)

    #=================================================== DAY 6
    time = time.to_date.advance(days:+1).to_time.utc

    ticket_1_day_promo = Ticket.find_by_code('ticket_1_day_promo')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day_promo, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_1_day = Ticket.find_by_code('ticket_1_day')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_1_day, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_2_of_3 = Ticket.find_by_code('ticket_2_of_3')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_2_of_3, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_3_of_5 = Ticket.find_by_code('ticket_3_of_5')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_3_of_5, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)

    ticket_5_of_7 = Ticket.find_by_code('ticket_5_of_7')
    scan = non_promo_resort.scan_lift_ticket_at_timestamp(ticket_5_of_7, time)
    self.assert(!scan.satisfy_amount_max_usage_dates?)
  end
end