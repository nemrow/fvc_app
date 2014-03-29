class User
  def self.get_user_by_login_code(login_code)
    family = Family.find_by_login_code(login_code)
    return family if family
    staff = Staff.find_by_login_code(login_code)
    return staff if staff
    false
  end

  def self.create_new_login_code
    random_code = Random.rand(1111..9999)
    existing_login_codes.include?(random_code) ? self.create_new_login_code : random_code
  end

  private
    def self.existing_login_codes
      family_codes = Family.all.map {|family| family.login_code }
      staff_codes = Staff.all.map {|staff| staff.login_code }
      all_codes = family_codes.concat(staff_codes)
    end
end