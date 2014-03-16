class Family < ActiveRecord::Base
  has_many :weeks, :through => :families_weeks
  has_many :families_weeks
  has_many :babysittings
end
