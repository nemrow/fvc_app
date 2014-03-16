class Family < ActiveRecord::Base
  attr_accessible :last_name, :login_code, :room_num

  has_many :weeks, :through => :families_weeks
  has_many :families_weeks
  has_many :babysittings

  def self.create_new_login_code
    random_code = Random.rand(1111..9999)
    existing_login_codes.include?(random_code) ? self.create_new_login_code : random_code
  end

  def self.existing_login_codes
    Family.all.map do |family|
      family.login_code
    end
  end
end
