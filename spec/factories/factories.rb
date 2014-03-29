require "faker"

FactoryGirl.define do
  factory :family do
    last_name  Faker::Name.last_name
    login_code Random.rand(1111..9999)
    room_num Random.rand(1111..9999)
  end

  factory :week do
    week_num Random.rand(1)
    min_date Time.new(2014, 5, 21, 12, 0)
    max_date Time.new(2014, 5, 28, 12, 0)
  end

  factory :babysitting do
    min_date Time.now
    max_date Time.now
    status "pending"
  end

  factory :staff do
    name Faker::Name.name
    login_code Random.rand(1111..9999)
  end

  factory :event_instance do
    min_date Time.now
    max_date Time.now
  end

  factory :event do 
    title Faker::Lorem.word
  end
end