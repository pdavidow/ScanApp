require 'test_helper'

class CurrentForSeasonTest < ActiveSupport::TestCase
  def test_0
    Ticket.descendants.each{|each| self.investigate(each)}
  end

  def investigate(ticket_class)
    company = self.example_company
    time  = Time.now.utc
    date = time.to_date

    Season.create_for_name_for_start_date_for_end_date('prior_season', date.advance(days:-45), date.advance(days:-4))
    prior_season = Season.find_by_name('prior_season')
    Season.create_for_name_for_start_date_for_end_date('current_season_1', date.advance(days:-45), date.advance(days:+45))
    current_season_1 = Season.find_by_name('current_season_1')
    Season.create_for_name_for_start_date_for_end_date('current_season_2', date.advance(days:-45), date)
    current_season_2 = Season.find_by_name('current_season_2')
    Season.create_for_name_for_start_date_for_end_date('next_season', date.advance(days:+145), date.advance(days:+245))
    next_season = Season.find_by_name('next_season')

    resort = company.resorts.first

    company.season = prior_season
    company.save
    company = Company.first
    ticket = ticket_class.create_for_company(company)
    scan = resort.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(!scan.current_for_season?)

    company.season = current_season_1
    company.save
    company = Company.first
    ticket = ticket_class.create_for_company(company)
    scan = resort.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.current_for_season?)

    company.season = current_season_2
    company.save
    company = Company.first
    ticket = ticket_class.create_for_company(company)
    scan = resort.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.current_for_season?)

    company.season = next_season
    company.save
    company = Company.first
    ticket = ticket_class.create_for_company(company)
    scan = resort.scan_lift_ticket_at_timestamp(ticket, time)
    self.assert(scan.current_for_season?)
  end
end