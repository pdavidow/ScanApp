class Ticket3Of5 < Ticket
  def amount_max_promo_usage_dates
    1
  end

  def amount_max_usage_dates
    3
  end

  def total_amount_of_consecutive_potential_usage_dates
    5
  end
end