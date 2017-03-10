class EventsController < ApplicationController
    def index
        curr_time = DateTime.now.to_date
        @all_events = Event.all
        @upcoming_events = @all_events.where("date >= :date and meeting = :meeting", {date: curr_time, meeting: [false]})
        @upcoming_events_email = @upcoming_events
        contact_uin_to_email
    end
    
    def new
    end
    
    def create
        
        # convert date input to correct format for database
        date = date_conversion
        
        @event = Event.create!(:name => params[:name],
                 :description => params[:description],
                 :address => params[:address],
                 :meeting => params[:meeting],
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
        if !@event.name.nil?
            flash[:success] = "Successfully Created Event: " + @event.name
        end
        redirect_to dashboard_index_path 
    end
    
    def show
        @event = Event.find(params[:id])
    end
    
    def meeting
        curr_time = DateTime.now.to_date
        all_events = Event.all
        # populate dropdown list
        @upcoming_meetings = all_events.where("date >= :date and meeting = :meeting", {date: curr_time, meeting: [true]})
    end
    
    def meeting_signin
    end
    
    
    private
        def event_params
            params.require(:event).permit(:name, :description, :address, :meeting, :UIN, :date, :start_time, :end_time, :max_points, :contact, :image)
        end
        
        def contact_uin_to_email
            # make the contact attribute represent the EMAIL instead of UIN 
            @upcoming_events_email.each do |event|
                event_contact = User.find_by(UIN: event.contact)
                puts event_contact.name
                event.contact = event_contact.name
            end
        end
        
        def date_conversion
            #convert date input of MM/DD/YYYY to DD-MM-YYYY
            if not params[:date].nil?
                date_arr = params[:date].split('/')
                date = date_arr[2] + '-' + date_arr[0] + '-' + date_arr[1]
            else
                date = "2017-03-15"
            end
            return date
        end
end
