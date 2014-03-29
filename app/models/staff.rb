class Staff < ActiveRecord::Base
  attr_accessible :login_code, :name

  has_many :babysittings
end
