require "#{Rails.root}/lib/base_class_extensions/object"

class SkiResort < ActiveRecord::Base
  belongs_to :company, inverse_of: :resorts, class_name: "SkiResortCompany"

  #def initialize(name, scan_wait_seconds)
    #self.name = name
    #self.scan_wait_seconds = scan_wait_seconds
  #end

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


