require 'spec_helper'

describe Week do
  before(:each) do
    @family = FactoryGirl.create(:family)
    @week = FactoryGirl.create(:week)
    @event_instance = FactoryGirl.create(:event_instance)
  end

  it "should have many families" do
    family_count = @week.families.count
    @week.families << @family
    @week.families.count.should eq(family_count + 1)
  end

  it "should have many event_instances" do
    event_instance_count = @week.event_instances.count
    @week.event_instances << @event_instance
    @week.event_instances.count.should eq(event_instance_count + 1)
  end
end
