require 'spec_helper'
require "debugger"

describe Family do
  before(:each) do
    @family = FactoryGirl.create(:family)
    @week = FactoryGirl.create(:week)
    @babysitting = FactoryGirl.create(:babysitting)
  end

  it "should have many weeks" do
    week_count = @family.weeks.count
    @family.weeks << @week
    @family.weeks.count.should eq(week_count + 1)
  end

  it "should have many babysittings" do
    babysitting_count = @family.babysittings.count
    @family.babysittings << @babysitting
    @family.babysittings.count.should eq(babysitting_count + 1)
  end
end
