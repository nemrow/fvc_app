class EventInstance < ActiveRecord::Base
  belongs_to :event
  belongs_to :week
end
