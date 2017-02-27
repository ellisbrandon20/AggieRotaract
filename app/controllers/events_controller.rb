class EventsController < ApplicationController
    def new
    end
    
    def create
        @event = Event.new(params[:event])
        
        @event.save
        redirect_to @event
    end
end
