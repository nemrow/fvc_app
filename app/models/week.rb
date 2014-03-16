class Week < ActiveRecord::Base
  has_many :families, :through => :families_weeks
  has_many :families_weeks
  has_many :event_instances
end
