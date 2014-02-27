require "#{Rails.root}/lib/base_class_extensions/object"

class LiftTicket < ActiveRecord::Base
  has_one :issuer, class_name: "SkiResortCompany"
  has_one :season, inverse_of: :lift_tickets, class_name: "SkiSeason"
  has_one  :state, inverse_of: :ticket, class_name: "TicketState"
  has_many :valid_last_daily_scans, inverse_of: :ticket, class_name: "LiftTicketScan"

  def self.new_for_issuer_for_season(issuer, season)
    ticket = self.new
    ticket.issuer = issuer
    ticket.season = season
    ticket
  end

  #def initialize(issuer, season)
    #self.issuer = issuer
    #self.season = season
    #self.state = TicketStateUnused.new(self)
  #end

  def unused?
    self.state.unused?
  end

  def in_usage_scope?
    self.state.in_usage_scope?
  end

  def expired?
    self.state.expired?
  end

  def state
    if super.nil? then
      state = TicketStateUnused.new
      state.ticket = self
      self.state = state
    end
    super
  end

  def amount_max_promo_usage_dates
    self.subclass_implementation
  end

  def amount_max_usage_dates
    self.subclass_implementation
  end

  def total_amount_of_consecutive_potential_usage_dates
    self.subclass_implementation
  end

  def valid_scan_dates
    self.valid_last_daily_scans.collect{|each| each.date}
  end

  def valid_unique_scan_dates_prior_to_scan(scan)
    dates = self.valid_scan_dates
    index = dates.find_index(scan.date)
    return dates if index.nil?
    dates.take(index)
  end

  def amount_promo_usage_on_distinct_dates_prior_to_scan(scan)
    (self.valid_last_daily_scans.select{|each| (each.resort.promo?) and (each.date < scan.date)}).size
  end

  def assert_scan_is_chronological(scan)
    self.state.assert_scan_is_chronological(scan)
  end

  def consider_changing_state_after_scan(scan)
    self.state.consider_changing_state_after_scan(scan)
  end

  def consider_storing_valid_scan(scan)
    self.state.consider_storing_valid_scan(scan)
  end

  def enter_usage_scope
    self.state.change_ticket_state_to_in_usage_scope
  end

  def expire
    self.state.change_ticket_state_to_expired
  end

  def perform_scan_for_resort_at_timestamp(resort, timestamp)
    #scan = LiftTicketScan.new(self, resort, timestamp)
    scan = LiftTicketScan.new
    scan.ticket = self
    scan.resort = resort
    scan.timestamp = timestamp
    self.assert_scan_is_chronological(scan)

    scan.validate
    self.consider_storing_valid_scan(scan) if scan.valid?
    self.consider_changing_state_after_scan(scan)

    scan
  end
end
