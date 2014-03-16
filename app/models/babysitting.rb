class Babysitting < ActiveRecord::Base
  belongs_to :family
  belongs_to :staff
end
