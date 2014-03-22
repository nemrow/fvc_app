class Utils
  def self.date_parser(date)
    DateTime.strptime(date, '%m/%d/%Y %I:%M %p')
  end
end