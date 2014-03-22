class ActiveSupport::TimeWithZone
  def js_date_format
    self.strftime("%Y, %m, %d, %H, %m")
  end

  def day_formatted
    self.strftime('%A %B %d')
  end

  def time_formatted
    self.strftime('%A %I:%M %p')
  end

  def m_d_formatted
    self.strftime("%m/%d")
  end
end