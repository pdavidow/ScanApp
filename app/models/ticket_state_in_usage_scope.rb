class TicketStateInUsageScope < TicketState

  def in_usage_scope?
    true
  end

  def change_ticket_state_to_in_usage_scope
  end

  def consider_storing_valid_scan(scan)
    prior_scan = self.valid_last_daily_scans.last
    return(self.valid_last_daily_scans.push(scan)) if (scan.date > prior_scan.date)
    self.valid_last_daily_scans[(self.valid_last_daily_scans.size)-1]=scan if (scan.date = prior_scan.date) # should be the case if got here
  end

  def change_state_to_expire_after_invalid_scan?(scan)
    return true if super(scan)
    return true if not scan.satisfy_amount_max_usage_dates?
    return true if not scan.satisfy_total_amount_of_consecutive_potential_usage_dates?
    return false
  end

  def local_to_resort_for_scan_date_on_latest_scan?(scan)
    prior_scan = self.valid_last_daily_scans.last
    return(true) if (scan.date > prior_scan.date)
    scan.resort == prior_scan.resort #dates are equal if got here
  end

  def satisfy_amount_max_usage_dates_on_latest_scan?(scan)
    scan.valid_unique_scan_dates_prior.size < self.ticket.amount_max_usage_dates
  end

  def satisfy_scan_wait_duration_on_latest_scan?(scan)
    prior_scan = self.valid_last_daily_scans.last
    (scan.timestamp - prior_scan.timestamp) > scan.resort.scan_wait_seconds
  end

  def satisfy_total_amount_of_consecutive_potential_usage_dates_on_latest_scan?(scan)
    dates = scan.valid_unique_scan_dates_prior
    return true if dates.empty?
    (scan.date - dates.first) < self.ticket.total_amount_of_consecutive_potential_usage_dates
  end
end
