class DateTime
  def m_d_formatted
    self.strftime("%m/%d")
  end

  def day_of_week
    self.strftime("%A")
  end
end