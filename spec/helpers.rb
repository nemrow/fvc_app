module Helpers
  def create_current_week
    Week.create(
      :min_date => (DateTime.now - 2.days), 
      :max_date => (DateTime.now + 5.days),
      :week_num => 1
    )
  end
end