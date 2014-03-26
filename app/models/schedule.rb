class Schedule
  def self.current_week_num
    Week.all.find do |week|
      week_range(week).include?(today)
    end
  end

  def self.week_events_sorted(week_num)
    week = Week.find(week_num)
    (week.min_date.to_datetime..week.max_date.to_datetime).map do |date|
      {
        :date => date,
        :events => Schedule.days_events(date),
        :day_of_week => date.day_of_week
      }
    end
  end

  def self.days_events(date)
    events = EventInstance.includes(:event).all.select do |ei|
      ei.min_date.m_d_formatted == date.m_d_formatted
    end
    events.sort_by {|event| event.min_date}.map
  end

  private
    def self.week_range(week)
      (week.min_date.beginning_of_day.to_datetime..week.max_date.beginning_of_day.to_datetime)
    end

    def self.today
      DateTime.now.beginning_of_day.to_datetime
    end
end