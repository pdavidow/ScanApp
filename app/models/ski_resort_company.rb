class SkiResortCompany < ActiveRecord::Base
  has_many :resorts, inverse_of: :company, class_name: "SkiResort"

  attr_accessor :promo_resorts, :non_promo_resorts

#  def initialize(resorts)
#    self.resorts = resorts
#  end

  def promo_resorts
    @promo_resorts ||= self.resorts.select{|each| each.promo?}
  end

  def non_promo_resorts
    @non_promo_resorts ||= self.resorts.select{|each| each.non_promo?}
  end

  def lift_ticket_1_day_promo_for_ski_season(season)
    #LiftTicket_1DayPromo.new(self, season)
    ticket = LiftTicket_1DayPromo.new
    ticket.issuer = self
    ticket.season = season
    ticket
  end

  def lift_ticket_1_day_for_ski_season(season)
    #LiftTicket1Day.new(self, season)
    ticket = LiftTicket1Day.new
    ticket.issuer = self
    ticket.season = season
    ticket
  end

  def lift_ticket_2_of_3_for_ski_season(season)
    #LiftTicket2Of3.new(self, season)
    ticket = LiftTicket2Of3.new
    ticket.issuer = self
    ticket.season = season
    ticket
  end

  def lift_ticket_3_of_5_for_ski_season(season)
    #LiftTicket3Of5.new(self, season)
    ticket = LiftTicket3Of5.new
    ticket.issuer = self
    ticket.season = season
    ticket
  end

  def lift_ticket_5_of_7_for_ski_season(season)
    #LiftTicket5Of7.new(self, season)
    ticket = LiftTicket5Of7.new
    ticket.issuer = self
    ticket.season = season
    ticket
  end
end
