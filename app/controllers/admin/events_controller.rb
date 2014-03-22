class Admin
  class EventsController < ApplicationController
    def index
      @week = Week.find(params[:week_id])
      # @event_instances = @week.event_instances.includes(:event)
      @event_instances = EventInstance.week_events_sorted(@week.week_num)
    end

    def new
      @week = Week.find(params[:week_id])
      @existing_events = Event.all
      @event = Event.new
      @event_instance = EventInstance.new
    end

    def create
      week = Week.find(params[:week_id])
      event_instance = EventInstance.parse_time_and_create(params[:event_instance])
      if params[:existing_event][:selected] == 'true'
        event = Event.find(params[:existing_event][:id])
      else
        event = Event.create(params[:event])
      end
      event_instance.event = event
      week.event_instances << event_instance
      redirect_to admin_week_events_path(params[:week_id])
    end
  end
end
