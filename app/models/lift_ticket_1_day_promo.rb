class LiftTicket_1DayPromo < LiftTicket
  def amount_max_promo_usage_dates
    self.amount_max_usage_dates
  end

  def amount_max_usage_dates
    self.total_amount_of_consecutive_potential_usage_dates
  end

  def total_amount_of_consecutive_potential_usage_dates
    1
  end
end