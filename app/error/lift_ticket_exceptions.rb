module LiftTicketExceptions
  class LiftTicketError < StandardError
  end

  class LiftTicketNonChronologicalScanError < LiftTicketError
  end
end