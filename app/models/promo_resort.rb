class PromoResort < Resort

  def promo?
    true
  end

  def ticket_satisfy_resort_type_on_latest_scan?(ticket, scan)
    return false if ticket.amount_max_promo_usage_dates == 0
    (ticket.amount_promo_usage_on_distinct_dates_prior_to_scan(scan)) < (ticket.amount_max_promo_usage_dates)
  end
end
