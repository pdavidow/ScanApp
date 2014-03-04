class TicketStateUnused < TicketState
  def unused?
    true
  end

  def assert_scan_is_chronological(scan)
  end

  def consider_changing_state_after_valid_scan(scan)
    self.ticket.enter_usage_scope
  end

  def consider_storing_valid_scan(scan)
    self.scans.push(scan)
  end

  def local_to_resort_for_scan_date_on_latest_scan?(scan)
    true
  end

  def satisfy_amount_max_usage_dates_on_latest_scan?(scan)
    true
  end

  def satisfy_scan_wait_duration_on_latest_scan?(scan)
    true
  end

  def satisfy_total_amount_of_consecutive_potential_usage_dates_on_latest_scan?(scan)
    true
  end
end
