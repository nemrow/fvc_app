require 'spec_helper'

describe Api::V1::UsersController do
  describe 'login' do
    before(:each) do
      @family = FactoryGirl.create(:family)
      @staff = FactoryGirl.create(:staff)
    end

    it "should redirect to family logged in" do
      get :login, :login_code => @family.login_code
      response.should redirect_to(api_v1_load_data_path(@family.login_code))
    end

    it "should redirect to staff logged in" do
      get :login, :login_code => @staff.login_code
      response.should redirect_to(api_v1_load_data_path(@staff.login_code))
    end

    it "should return false loin" do
      expected = {:success => false}.to_json
      get :login, :login_code => "12345"
      response.body.should eq(expected)
    end
  end

  describe "load_data" do
    before(:each) do
      create_current_week
      @family = FactoryGirl.create(:family)
    end

    it "should return schedule" do
      get :load_data, :login_code => @family.login_code
      result = JSON.parse(response.body)
      result['success'].should eq(true)
      result['schedule'].count.should eq(8)
    end
  end
end
