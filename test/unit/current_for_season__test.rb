require 'test_helper'

class CurrentForSeasonTest < ActiveSupport::TestCase
  def test_0
    LiftTicket.descendants.each{|each| self.investigate(each)}
  end

  def investigate(ticket_class)
    company = self.example_company
    time  = Time.now.utc
    date = time.to_date
    #current_season = SkiSeason.new(date.advance(days:-45), date.advance(days:+45))
    prior_season = SkiSeason.new
    prior_season.start_date = date.advance(days:-45)
    prior_season.end_date = date.advance(days:-4)
    current_season_1 = SkiSeason.new
    current_season_1.start_date = date.advance(days:-45)
    current_season_1.end_date = date.advance(days:+45)
    current_season_2 = SkiSeason.new
    current_season_2.start_date = date.advance(days:-45)
    current_season_2.end_date = date
    next_season = SkiSeason.new
    next_season.start_date = date.advance(days:145)
    next_season.end_date = date.advance(days:245)
    resort = company.resorts.first

    ticket = ticket_class.new_for_issuer_for_season(company, prior_season)
    scan = resort.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(!scan.current_for_season?)

    ticket = ticket_class.new_for_issuer_for_season(company, current_season_1)
    scan = resort.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.current_for_season?)

    ticket = ticket_class.new_for_issuer_for_season(company, current_season_2)
    scan = resort.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.current_for_season?)

    ticket = ticket_class.new_for_issuer_for_season(company, next_season)
    scan = resort.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.current_for_season?)
  end
end