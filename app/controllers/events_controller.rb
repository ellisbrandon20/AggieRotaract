class EventsController < ApplicationController
    def index
        curr_time = DateTime.now.to_date
        @all_events = Event.all
        @upcoming_events = @all_events.where("date >= :date", {date: curr_time})
    end
    
    def new
    end
    
    def create
        
        if not params[:date].nil?
            date_arr = params[:date].split('/')
            date = date_arr[2] + '-' + date_arr[0] + '-' + date_arr[1]
        else
            date = "2017-03-15"
        end
        
        @event = Event.create!(:name => params[:name],
                 :description => params[:description],
                 :address => params[:address],
                 :meeting => params[:meeting] == '1' ? true : false,
                 :date => date,
                 :start_time => params[:start_time],
                 :end_time => params[:end_time],
                 :max_points => params[:max_points],
                 :capacity => params[:capacity],
                 :contact => params[:contact],
                 :image => params[:image])
                 
        @event.save
        
        
        
        # respond_to do
        #     format.html {}
        #     format.js { render :js => "update_img();" }
        # end
        # render :js => "update_img();"
        flash[:success] = "Successfully Created Event: " + @event.name
        redirect_to dashboard_index_path 
    end
    
    def show
        @event = Event.find(params[:id])
    end
    
    
    private
        def event_params
            params.require(:event).permit(:name, :description, :address, :meeting, :UIN, :date, :start_time, :end_time, :max_points, :contact, :image)
        end
end
