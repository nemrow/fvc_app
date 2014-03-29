class BabysittingTimeslot < ActiveRecord::Base
  attr_accessible :time_slot

  def time_slot
    time_slot.time_of_day_formatted
  end
end
