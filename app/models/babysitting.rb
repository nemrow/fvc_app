class Babysitting < ActiveRecord::Base
  attr_accessible :min_date, :max_date

  belongs_to :family
  belongs_to :staff
  belongs_to :week

  def self.get_full_weeks_babysittings(week)
    (week.min_date.to_datetime..week.max_date.to_datetime).map do |date|
      {
        :date => date,
        :babysittings => get_single_days_babysittings_with_associations(date),
        :day_of_week => date.day_of_week
      }
    end
  end

  def self.get_single_days_babysittings_with_associations(date)
    Babysitting.includes(:family).includes(:staff).all.select do |babysitting|
      babysitting.min_date.m_d_formatted == date.m_d_formatted
    end
  end

  def self.get_single_days_babysittings(date)
    Babysitting.all.select do |babysitting|
      babysitting.min_date.m_d_formatted == date.m_d_formatted
    end
  end

  def self.get_time_slots_for_day(date)
    babysittings = get_single_days_babysittings(date)
    time_slots = babysittings.map do |babysitting|
      {
        :min_date => babysitting.min_date.time_of_day_formatted,
        :max_date => babysitting.max_date.time_of_day_formatted
      }
    end
    time_slots.uniq
  end
end
