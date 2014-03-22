class Event < ActiveRecord::Base
  attr_accessible :title, :description

  has_many :event_instances
end
