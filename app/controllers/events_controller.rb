class EventsController < ApplicationController
    require 'date'
    
    def new
    end
    
    def create
        date_arr = event_params[:date].split('/')
        date = date_arr[2] + '-' + date_arr[0] + '-' + date_arr[1]
        
        @event = Event.create!(:name => event_params[:name],
                 :description => event_params[:description],
                 :address => event_params[:address],
                 :meeting => event_params[:meeting] == '1' ? true : false,
                 :date => date,
                 :start_time => event_params[:start_time],
                 :end_time => event_params[:end_time],
                 :max_points => event_params[:max_points],
                 :contact => event_params[:contact],
                 :image => event_params[:image])
                 
        @event.save
        redirect_to @event
    end
    
    def show
        @event = Event.find(params[:id])
    end
    
    
    private
        def event_params
            params.require(:event).permit(:name, :description, :address, :meeting, :UIN, :date, :start_time, :end_time, :max_points, :contact, :image)
        end
end
