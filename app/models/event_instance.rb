class EventInstance < ActiveRecord::Base
  attr_accessible :min_date, :max_date
  
  belongs_to :event
  belongs_to :week

  def self.parse_time_and_create(params)
    self.create(
      :min_date => Utils.date_parser(params[:min_date]),
      :max_date => Utils.date_parser(params[:max_date])
    )
  end

  def self.week_events_sorted(week_num)
    week = Week.find(week_num)
    (week.min_date.to_datetime..week.max_date.to_datetime).map do |date|
      {
        :date => date,
        :events => EventInstance.days_events(date),
        :day_of_week => date.day_of_week
      }
    end
  end

  def self.days_events(date)
    events = EventInstance.includes(:event).all.select do |ei|
      ei.min_date.m_d_formatted == date.m_d_formatted
    end
    events.sort_by {|event| event.min_date}
  end
end
