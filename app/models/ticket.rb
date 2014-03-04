require "#{Rails.root}/lib/base_class_extensions/object"

class Ticket < ActiveRecord::Base
  belongs_to :company
  has_one :ticket_state
  has_many :scans

  def self.new_for_company(company)
    instance = self.new
    instance.company = company
    instance.ticket_state = TicketStateUnused.new
    instance
  end

  def self.create_for_company(company)
    instance = self.new_for_company(company)
    instance.save
    instance
  end

  def unused?
    self.ticket_state.unused?
  end

  def in_usage_scope?
    self.ticket_state.in_usage_scope?
  end

  def expired?
    self.ticket_state.expired?
  end

  def season
    self.company.season
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
    self.scans.collect{|each| each.date}
  end

  def valid_unique_scan_dates_prior_to_scan(scan)
    dates = self.valid_scan_dates
    index = dates.find_index(scan.date)
    return dates if index.nil?
    dates.take(index)
  end

  def amount_promo_usage_on_distinct_dates_prior_to_scan(scan)
    (self.scans.select{|each| (each.resort.promo?) and (each.date < scan.date)}).size
  end

  def assert_scan_is_chronological(scan)
    self.ticket_state.assert_scan_is_chronological(scan)
  end

  def consider_changing_state_after_scan(scan)
    self.ticket_state.consider_changing_state_after_scan(scan)
    self.ticket_state(true) #refresh cache
  end

  def store_valid_scan(scan)
    self.ticket_state.store_valid_scan(scan)
    self.scans(true) #refresh cache
  end

  def enter_usage_scope
    self.ticket_state.change_ticket_state_to_in_usage_scope
  end

  def expire
    self.ticket_state.change_ticket_state_to_expired
  end

  def perform_scan_for_resort_at_timestamp(resort, timestamp)
    scan = Scan.new_for_ticket_for_resort_for_timestamp(self, resort, timestamp)
    self.assert_scan_is_chronological(scan)

    scan.validate
    self.store_valid_scan(scan) if scan.valid_scan?
    self.consider_changing_state_after_scan(scan)
    self.save

    scan
  end
end
