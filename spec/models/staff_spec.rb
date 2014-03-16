require 'spec_helper'

describe Staff do
  before(:each) do
    @babysitting = FactoryGirl.create(:babysitting)
    @staff = FactoryGirl.create(:staff)
  end

  it "should have many babysittings" do
    babysittings_count = @staff.babysittings.count
    @staff.babysittings << @babysitting
    @staff.babysittings.count.should eq(babysittings_count + 1)
  end
end
