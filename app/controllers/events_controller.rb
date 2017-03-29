class EventsController < ApplicationController
    def index
        curr_time = DateTime.now.to_date
        @all_events = Event.all
        @upcoming_events = @all_events.where("date >= :date and meeting = :meeting", {date: curr_time, meeting: [false]})
        @upcoming_events_email = @upcoming_events
        contact_uin_to_name
    end
    
    def new
        grab_officers
    end

    def remove_from_event
        
        if Attendance.where(:UIN => session[:user_uin]).where(:event_id => params[:event_id]).where(:wait_listed => false).present?
            if Attendance.where(:event_id => params[:event_id]).where(:wait_listed => true).present?
                @waitlist=Attendance.where(:event_id => params[:event_id]).where(:wait_listed => true)
                @sorted_waitlist = @waitlist.sort { |a,b| a.time_stamp <=> b.time_stamp }
                @sorted_waitlist[0].update_attribute :wait_listed, false
            end
        end
        # find out is user is going
            # query grab Attendances.where event_id = id waitlist = true
            # doe the sort
            # make index 0 user waitlist boolean = false
        Attendance.where(:UIN => session[:user_uin]).where(:event_id => params[:event_id]).destroy_all
        flash[:success] = "You have been removed from the event!"
        redirect_to :back
    end
    
    def create
        
        puts "--- uploading file to cloud"
        Cloudinary::Uploader.upload(params[:image], :use_filename => true, :unique_filename => false)
        puts "--- uploading complete!!!!!!"
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
        @event = Event.find_by name: params[:event_name]
    end
    
    def edit
        @event = Event.find(params[:id])
        
        grab_officers
        
    end
    
    def update
        @event = Event.find(params[:id])
        puts "============ edit " + @event.name
        # convert date input to correct format for database
        date = date_conversion
        @event.update_attributes!(:name => params[:name],
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
        # @movie.update_attributes!(movie_params)
        flash[:success] = "#{@event.name} was successfully updated."
        #redirect_to movie_path(@movie)
        redirect_to events_path
    end
    
    
    private
        def event_params
            params.require(:event).permit(:name, :description, :address, :meeting, :UIN, :date, :start_time, :end_time, :max_points, :contact, :image)
        end
        
        def contact_uin_to_name
            # make the contact attribute represent the EMAIL instead of UIN 
            @upcoming_events_email.each do |event|
                event_contact = User.find_by(UIN: event.contact)
                event.contact = event_contact.name   
            end
        end
        
        def date_conversion
            #convert date input of MM/DD/YYYY to YYYY-MM-DD
            if not params[:date].nil?
                date_arr = params[:date].split('/')
                date = date_arr[2] + '-' + date_arr[0] + '-' + date_arr[1]
            else
                date = "2017-03-15"
            end
            return date
        end
        
        def grab_officers
            @officers = User.where("officer = :officer", {officer: [true]})
            @officers.each do |officer|
                puts "-----officer:" + officer.name + "---uin:" + officer.UIN.to_s
            end
        end
end
