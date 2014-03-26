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
end
