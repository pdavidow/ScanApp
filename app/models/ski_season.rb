class SkiSeason < ActiveRecord::Base
  has_many :lift_tickets, inverse_of: :season

  #def initialize(start_date, end_date)
    #self.start_date = start_date
    #self.end_date = end_date
  #end
end
