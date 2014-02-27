class ScanValidator < Object
  attr_accessor :scan

  def initialize(scan)
    @scan = scan
  end

  def current_for_season?
    @is_current_for_season ||= self.state.current_for_season_on_latest_scan?(self.scan)
  end

  def local_to_resort_for_scan_date?
    @is_local_to_resort_for_scan_date ||= self.state.local_to_resort_for_scan_date_on_latest_scan?(self.scan)
  end

  def satisfy_amount_max_usage_dates?
    @is_satisfy_amount_max_usage_dates ||= self.state.satisfy_amount_max_usage_dates_on_latest_scan?(self.scan)
  end

  def satisfy_resort_type?
    @is_satisfy_resort_type ||= self.state.satisfy_resort_type_on_latest_scan?(self.scan)
  end

  def satisfy_scan_wait_duration?
    @is_satisfy_scan_wait_duration ||= self.state.satisfy_scan_wait_duration_on_latest_scan?(self.scan)
  end

  def satisfy_total_amount_of_consecutive_potential_usage_dates?
    @is_satisfy_total_amount_of_consecutive_potential_usage_dates ||= self.state.satisfy_total_amount_of_consecutive_potential_usage_dates_on_latest_scan?(self.scan)
  end

  def valid?
    @is_valid ||= self.make_is_valid
  end

  def make_is_valid
    return false unless self.current_for_season?
    return false unless self.local_to_resort_for_scan_date?
    return false unless self.satisfy_scan_wait_duration?
    return false unless self.satisfy_resort_type?
    return false unless self.satisfy_amount_max_usage_dates?
    return false unless self.satisfy_total_amount_of_consecutive_potential_usage_dates?
    true
  end

  def state
    self.ticket.state
  end

  def ticket
    self.scan.ticket
  end

  def validate
    self.valid?
  end
end
