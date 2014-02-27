class NonPromoSkiResort < SkiResort

  def non_promo?
    true
  end

  def ticket_satisfy_resort_type_on_latest_scan?(ticket, scan)
    true
  end
end
