require 'spec_helper'
require 'debugger'

describe Babysitting do
  before(:each) do
    @family = FactoryGirl.create(:family)
    @babysitting = FactoryGirl.create(:babysitting)
    @staff = FactoryGirl.create(:staff)
  end

  it "should belong to staff" do
    @babysitting.staff = @staff
    @babysitting.staff.should eq(@staff)
  end

  it "should belong to family" do
    @babysitting.family = @family
    @babysitting.family.should eq(@family)
  end
end
