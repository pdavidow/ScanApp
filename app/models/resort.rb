require "#{Rails.root}/lib/base_class_extensions/object"

class Resort < ActiveRecord::Base
  belongs_to :company

  def self.new_for_name_for_scan_wait_seconds(name, scan_wait_seconds)
    instance = self.new
    instance.name = name
    instance.scan_wait_seconds = scan_wait_seconds
    instance
  end

  def self.create_for_name_for_scan_wait_seconds(name, scan_wait_seconds)
    instance = self.new_for_name_for_scan_wait_seconds(name, scan_wait_seconds)
    instance.save
    instance
  end

  def promo?
    false
  end

  def non_promo?
    false
  end

  def ticket_satisfy_resort_type_on_latest_scan?(ticket, scan)
    self.subclass_implementation
  end

  def scan_lift_ticket(ticket)
    self.scan_lift_ticket_at_timestamp(ticket, Time.now)
  end

  def scan_lift_ticket_at_timestamp(ticket, timestamp)
    ticket.perform_scan_for_resort_at_timestamp(self, timestamp)
  end
end


