module Admin
  class BabysittingsController < ApplicationController
    def index
      @week = Week.find_by_id(params[:week_id])
      @week_days = Schedule.week_range(@week)
    end

    def single_day
      @week = Week.find_by_id(params[:week_id])
      @date = DateTime.parse(params[:date])
      @babysittings = Babysitting.get_single_days_babysittings_with_associations(@date)
    end
  end
end
