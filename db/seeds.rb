require 'faker'

def rand_day
  rand(22..29)
end

def rand_hour
  rand(1..20)
end

@week = Week.first

20.times { Event.create(:title => Faker::Lorem.word, :description => Faker::Lorem.sentence) }

50.times do |num|
  day = rand_day
  hour = rand_hour
  ei = EventInstance.create(
    :min_date => DateTime.new(2014, 3, day, hour, 0),
    :max_date => DateTime.new(2014, 3, day, hour+1, 0)
  )
  @week.event_instances << ei
  event = Event.find(rand(1..20))
  ei.event = event
  ei.save
end

20.times do 
  day = rand_day
  hour = rand_hour
  family = Family.find(rand(Family.count) + 1)
  babysitting = Babysitting.create(
    :min_date => DateTime.new(2014, 3, day, hour, 0),
    :max_date => DateTime.new(2014, 3, day, hour+1, 0)
  )
  family.babysittings << babysitting
  babysitting.week = @week
  babysitting.save
end