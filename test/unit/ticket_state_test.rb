require 'test_helper'

class TicketStateTest < ActiveSupport::TestCase
  def test_unused__expired__lift_ticket_1_day
    #Go straight from Unused to Expired, because season ended

    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts.first

    ticket = company.lift_ticket_1_day_for_ski_season(current_season)

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time.to_date.advance(days:+100).to_time
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)
  end

  def test_unused__in_usage_scope__expired__lift_ticket_1_day
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.lift_ticket_1_day_for_ski_season(current_season)

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time)

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)
  end

  def test_exceed__amount_max_usage_dates__lift_ticket_2_of_3
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.lift_ticket_2_of_3_for_ski_season(current_season)

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 2

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 3

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)
  end

  def test_exceed__amount_max_usage_dates__lift_ticket_3_of_5
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.lift_ticket_3_of_5_for_ski_season(current_season)

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 2

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 3

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 4

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)
  end

  def test_exceed__amount_max_usage_dates__lift_ticket_5_of_7
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.lift_ticket_5_of_7_for_ski_season(current_season)

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 2

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 3

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 4

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 5

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+1).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 6

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)
  end

  def test_exceed__total_amount_of_consecutive_potential_usage_dates__lift_ticket_2_of_3
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.lift_ticket_2_of_3_for_ski_season(current_season)

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+3).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 4

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)
  end

  def test_exceed__total_amount_of_consecutive_potential_usage_dates__lift_ticket_3_of_5
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.lift_ticket_3_of_5_for_ski_season(current_season)

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+5).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 6

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)
  end

  def test_exceed__total_amount_of_consecutive_potential_usage_dates__lift_ticket_5_of_7
    company = self.example_company
    original_time  = Time.now.utc
    date = original_time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    current_season = SkiSeason.new
    current_season.start_date = date.advance(days:-45)
    current_season.end_date = date.advance(days:+45)
    non_promo_resort = company.non_promo_resorts[0]

    ticket = company.lift_ticket_5_of_7_for_ski_season(current_season)

    self.assert(ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = original_time
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 1

    self.assert(!ticket.unused?)
    self.assert(ticket.in_usage_scope?)
    self.assert(!ticket.expired?)

    time = time.to_date.advance(days:+7).to_time.utc
    non_promo_resort.scan_lift_ticket_at_timestamp(ticket, time) #day 8

    self.assert(!ticket.unused?)
    self.assert(!ticket.in_usage_scope?)
    self.assert(ticket.expired?)
  end
end
