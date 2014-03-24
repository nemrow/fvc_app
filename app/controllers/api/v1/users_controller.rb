module Api
  module V1
    class UsersController < ActionController::Base
      def login
        family = Family.find_by_login_code(params[:login_code])
        staff = Staff.find_by_login_code(params[:login_code])
        if family
          redirect_to api_v1_load_data_path(family.login_code)
        elsif staff
          redirect_to api_v1_load_data_path(staff.login_code)
        else
          render :json => {:success => true}
        end
      end
    end

    def load_data
      
    end
  end
end
