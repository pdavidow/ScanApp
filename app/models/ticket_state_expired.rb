class TicketStateExpired < TicketState
  def expired?
    true
  end

  def change_ticket_state_to_expired
  end

  def consider_changing_state_after_scan(scan)
  end

  def change_state_to_expire_after_invalid_scan?(scan)
    false
  end

  def current_for_season_on_latest_scan?(scan)
    false
  end

  def local_to_resort_for_scan_date_on_latest_scan?(scan)
    false
  end

  def satisfy_amount_max_usage_dates_on_latest_scan?(scan)
    false
  end

  def satisfy_resort_type_on_latest_scan?(scan)
    false
  end

  def satisfy_total_amount_of_consecutive_potential_usage_dates_on_latest_scan?(scan)
    false
  end

  def satisfy_total_amount_of_consecutive_potential_usage_dates_on_latest_scan?(scan)
    false
  end

  def satisfy_scan_wait_duration_on_latest_scan?(scan)
    false
  end
end
