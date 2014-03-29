class DateTime
  def m_d_formatted
    self.strftime("%m/%d")
  end

  def day_of_week
    self.strftime("%A")
  end

  def day_formatted
    self.strftime('%A %B %d')
  end

  def time_of_day_formatted
    self.strftime("%M:%I %p")
  end
end