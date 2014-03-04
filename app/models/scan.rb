class Scan < ActiveRecord::Base
  belongs_to :resort
  belongs_to :ticket

  attr_accessor :validator, :date, :valid_unique_scan_dates_prior

  def self.new_for_ticket_for_resort_for_timestamp(ticket, resort, timestamp)
    instance = self.new
    instance.ticket = ticket
    instance.resort = resort
    instance.timestamp = timestamp
    instance
  end

  def validator
    @validator ||= ScanValidator.new(self)
  end

  def date
    @date ||= self.timestamp.to_date
  end

  def valid_unique_scan_dates_prior
    @valid_unique_scan_dates_prior ||= self.ticket.valid_unique_scan_dates_prior_to_scan(self)
  end

  def current_for_season?
    self.validator.current_for_season?
  end

  def local_to_resort_for_scan_date?
    self.validator.local_to_resort_for_scan_date?
  end

  def satisfy_amount_max_usage_dates?
    self.validator.satisfy_amount_max_usage_dates?
  end

  def satisfy_resort_type?
    self.validator.satisfy_resort_type?
  end

  def satisfy_scan_wait_duration?
    self.validator.satisfy_scan_wait_duration?
  end

  def satisfy_total_amount_of_consecutive_potential_usage_dates?
    self.validator.satisfy_total_amount_of_consecutive_potential_usage_dates?
  end

  def valid_scan?
    self.validator.valid?
  end

  def valid_for_frequency?
    return false unless self.satisfy_amount_max_usage_dates?
    return false unless self.satisfy_total_amount_of_consecutive_potential_usage_dates?
    true
  end

  def valid_for_resort_type_and_frequency?
    return false unless self.satisfy_resort_type?
    return false unless self.valid_for_frequency?
    true
  end

  def validate
    self.validator.validate
  end
end