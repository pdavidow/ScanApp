class Season < ActiveRecord::Base
  belongs_to :company

  def self.new_for_name_for_start_date_for_end_date(name=nil, start_date, end_date)
    instance = self.new
    instance.name = name
    instance.start_date = start_date
    instance.end_date = end_date
    instance
  end

  def self.create_for_name_for_start_date_for_end_date(name=nil, start_date, end_date)
    instance = self.new_for_name_for_start_date_for_end_date(name, start_date, end_date)
    instance.save
    instance
  end

  def self.create_for_start_date_for_end_date(start_date, end_date)
    self.create_for_name_for_start_date_for_end_date(start_date, end_date)
  end
end
