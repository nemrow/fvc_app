class FamiliesWeek < ActiveRecord::Base
  belongs_to :family
  belongs_to :week
end
