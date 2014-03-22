class Week < ActiveRecord::Base
  attr_accessible :week_num, :min_date, :max_date
  
  has_many :families, :through => :families_weeks
  has_many :families_weeks
  has_many :event_instances
end
