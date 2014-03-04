class Company < ActiveRecord::Base
  has_many :resorts, dependent: :destroy
  has_one :season
  has_many :tickets

  attr_accessor :promo_resorts, :non_promo_resorts

  def promo_resorts
    @promo_resorts ||= self.resorts.select{|each| each.promo?}
  end

  def non_promo_resorts
    @non_promo_resorts ||= self.resorts.select{|each| each.non_promo?}
  end

  def ticket_1_day_promo
    Ticket_1DayPromo.create_for_company(self)
  end

  def ticket_1_day
    Ticket1Day.create_for_company(self)
  end

  def ticket_2_of_3
    Ticket2Of3.create_for_company(self)
  end

  def ticket_3_of_5
    Ticket3Of5.create_for_company(self)
  end

  def ticket_5_of_7
    Ticket5Of7.create_for_company(self)
  end
end
