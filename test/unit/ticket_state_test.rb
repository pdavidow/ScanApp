require 'test_helper'

class TicketStateTest < ActiveSupport::TestCase
  def test_unused__expired__lift_ticket_1_day
    #Go straight from Unused to Expired, because season ended

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
    ticket.code = 'ticket_1_day'
    ticket.save

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time.to_date.advance(days:+100).to_time
    ticket = Ticket.find_by_code('ticket_1_day')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)

    ticket.destroy
  end

  def test_unused__in_usage_scope__expired__lift_ticket_1_day
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.ticket_1_day
    ticket.code = 'ticket_1_day'
    ticket.save

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    ticket = Ticket.find_by_code('ticket_1_day')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_1_day')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)

    ticket.destroy
  end

  def test_exceed__amount_max_usage_dates__lift_ticket_2_of_3
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.ticket_2_of_3
    ticket.code = 'ticket_2_of_3'
    ticket.save

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    ticket = Ticket.find_by_code('ticket_2_of_3')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_2_of_3')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 2

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_2_of_3')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 3

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)

    ticket.destroy
  end

  def test_exceed__amount_max_usage_dates__lift_ticket_3_of_5
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.ticket_3_of_5
    ticket.code = 'ticket_3_of_5'
    ticket.save

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    ticket = Ticket.find_by_code('ticket_3_of_5')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_3_of_5')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 2

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_3_of_5')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 3

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_3_of_5')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 4

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)

    ticket.destroy
  end

  def test_exceed__amount_max_usage_dates__lift_ticket_5_of_7
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.ticket_5_of_7
    ticket.code = 'ticket_5_of_7'
    ticket.save

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    ticket = Ticket.find_by_code('ticket_5_of_7')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_5_of_7')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 2

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_5_of_7')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 3

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_5_of_7')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 4

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_5_of_7')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 5

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    ticket = Ticket.find_by_code('ticket_5_of_7')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 6

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)

    ticket.destroy
  end

  def test_exceed__total_amount_of_consecutive_potential_usage_dates__lift_ticket_2_of_3
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.ticket_2_of_3
    ticket.code = 'ticket_2_of_3'
    ticket.save

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    ticket = Ticket.find_by_code('ticket_2_of_3')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+3).to_time.utc
    ticket = Ticket.find_by_code('ticket_2_of_3')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 4

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)

    ticket.destroy
  end

  def test_exceed__total_amount_of_consecutive_potential_usage_dates__lift_ticket_3_of_5
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.ticket_3_of_5
    ticket.code = 'ticket_3_of_5'
    ticket.save

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    ticket = Ticket.find_by_code('ticket_3_of_5')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+5).to_time.utc
    ticket = Ticket.find_by_code('ticket_3_of_5')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 6

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)

    ticket.destroy
  end

  def test_exceed__total_amount_of_consecutive_potential_usage_dates__lift_ticket_5_of_7
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    Season.create_for_start_date_for_end_date(date.advance(days:-45), date.advance(days:+45))
    current_season = Season.first
    company.season = current_season
    company.save
    company = Company.first
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.ticket_5_of_7
    ticket.code = 'ticket_5_of_7'
    ticket.save

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    ticket = Ticket.find_by_code('ticket_5_of_7')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+7).to_time.utc
    ticket = Ticket.find_by_code('ticket_5_of_7')
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 8

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)

    ticket.destroy
  end
end
