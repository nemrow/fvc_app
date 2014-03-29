module Api
  module V1
    class UsersController < ActionController::Base
      before_filter :cors_preflight_check
      after_filter :cors_set_access_control_headers

      def login
        user = User.get_user_by_login_code(params[:login_code])
        if user
          redirect_to api_v1_load_data_path(user.login_code)
        else
          render :json => {:success => false}
        end
      end

      def load_data
        user = User.get_user_by_login_code(params[:login_code])
        current_week = Schedule.current_week_num
        if current_week
          schedule = Schedule.week_events_sorted(current_week)
          json = {
            :success => true,
            :schedule => schedule,
            :events => Event.all
          }
          render :json => json
        else
          # not within the correct weeks
        end
      end

      private
         # For all responses in this controller, return the CORS access control headers.
        def cors_set_access_control_headers
          headers['Access-Control-Allow-Origin'] = '*'
          headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
          headers['Access-Control-Max-Age'] = "1728000"
        end

        # If this is a preflight OPTIONS request, then short-circuit the
        # request, return only the necessary headers and return an empty
        # text/plain.
        def cors_preflight_check
          if request.method == :options
            headers['Access-Control-Allow-Origin'] = '*'
            headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
            headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
            headers['Access-Control-Max-Age'] = '1728000'
            render :text => '', :content_type => 'text/plain'
          end
        end
    end
  end
end
