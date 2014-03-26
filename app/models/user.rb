class User
  def self.get_user_by_login_code(login_code)
    family = Family.find_by_login_code(login_code)
    return family if family
    staff = Staff.find_by_login_code(login_code)
    return staff if staff
    false
  end
end