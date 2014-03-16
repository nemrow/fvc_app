require 'spec_helper'

describe EventInstance do
  before(:each) do
    @week = FactoryGirl.create(:week)
    @event_instance = FactoryGirl.create(:event_instance)
    @event = FactoryGirl.create(:event)
  end

  it "should belong to an event" do
    @event_instance.event = @event
    @event_instance.event.should eq(@event)
  end

  it "should belong to an week" do
    @event_instance.week = @week
    @event_instance.week.should eq(@week)
  end
end
