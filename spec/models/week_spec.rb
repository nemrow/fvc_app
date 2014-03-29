require 'spec_helper'

describe Week do
  before(:each) do
    @family = FactoryGirl.create(:family)
    @week = FactoryGirl.create(:week)
    @event_instance = FactoryGirl.create(:event_instance)
    @babysitting = FactoryGirl.create(:babysitting)
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

  it "should have many weeks" do
    babysitting_count = @week.babysittings.count
    @week.babysittings << @babysitting
    @week.babysittings.count.should eq(babysitting_count + 1)
  end
end
