require 'spec_helper'

describe Api::V1::UsersController do
  # before(:each) do
  #   @family = FactoryGirl.create(:family)
  #   @week = FactoryGirl.create(:week)
  #   @babysitting = FactoryGirl.create(:babysitting)
  # end

  it "should have many weeks" do
    expected = {:success => true}.to_json
    get :login
    response.body.should == expected
  end
end
