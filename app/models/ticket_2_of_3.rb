class Ticket2Of3 < Ticket
  def amount_max_promo_usage_dates
    0
  end

  def amount_max_usage_dates
    2
  end

  def total_amount_of_consecutive_potential_usage_dates
    3
  end
end