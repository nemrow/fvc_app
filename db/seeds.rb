require 'faker'

@week = Week.first

20.times { Event.create(:title => Faker::Lorem.word, :description => Faker::Lorem.word) }

50.times do |num|
  day = rand(21..28)
  hour = rand(1..20)
  ei = EventInstance.create(
    :min_date => DateTime.new(2014, 6, day, hour, 0),
    :max_date => DateTime.new(2014, 6, day, hour+1, 0)
  )
  @week.event_instances << ei
  event = Event.find(rand(1..20))
  ei.event = event
  ei.save
end