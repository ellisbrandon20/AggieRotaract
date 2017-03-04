class EventsController < ApplicationController
    def new
    end
    
    def create
        @event = Event.new(event_params)
        
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
