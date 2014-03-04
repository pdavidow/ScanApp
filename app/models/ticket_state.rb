require "#{Rails.root}/lib/base_class_extensions/object"

class TicketState < ActiveRecord::Base
  include LiftTicketExceptions
  belongs_to :ticket

  def expired?
    false
  end

  def in_usage_scope?
    false
  end

  def unused?
    false
  end

  def assert_scan_is_chronological(scan)
    #Since only latest valid scans are stored, that is all we can test against
    prior_scan = self.scans.last
    raise LiftTicketNonChronologicalScanError if scan.timestamp <= prior_scan.timestamp
  end

  def change_ticket_state_to_expired
    self.ticket.ticket_state = TicketStateExpired.new
  end

  def change_ticket_state_to_in_usage_scope
    self.ticket.ticket_state = TicketStateInUsageScope.new
  end

  def consider_changing_state_after_invalid_scan(scan)
    self.ticket.expire if self.change_state_to_expire_after_invalid_scan?(scan)
  end

  def consider_changing_state_after_scan(scan)
    if scan.valid_scan? then
      self.consider_changing_state_after_valid_scan(scan)
    else
      self.consider_changing_state_after_invalid_scan(scan)
    end
  end

  def consider_changing_state_after_valid_scan(scan)
  end

  def consider_storing_valid_scan(scan)
  end

  def change_state_to_expire_after_invalid_scan?(scan)
    not scan.current_for_season?
  end

  def current_for_season_on_latest_scan?(scan)
    scan.date <= self.ticket.season.end_date
  end

  def local_to_resort_for_scan_date_on_latest_scan?(scan)
    self.subclass_implementation
  end

  def satisfy_amount_max_usage_dates_on_latest_scan?(scan)
    self.subclass_implementation
  end

  def satisfy_resort_type_on_latest_scan?(scan)
    scan.resort.ticket_satisfy_resort_type_on_latest_scan?(self.ticket, scan)
  end

  def satisfy_scan_wait_duration_on_latest_scan?(scan)
    self.subclass_implementation
  end

  def satisfy_total_amount_of_consecutive_potential_usage_dates_on_latest_scan?(scan)
    self.subclass_implementation
  end

  def scans
    self.ticket.scans
  end
end
