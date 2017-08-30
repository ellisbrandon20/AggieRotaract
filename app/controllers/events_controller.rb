class EventsController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        curr_time = DateTime.now.to_date
        @all_events = Event.order(:date).all
        
        if !session[:user_uin].nil?
            puts '--- member is logged in'
            @upcoming_events = @all_events.where("date >= :date and meeting = :meeting and publish = :published", {date: curr_time, meeting: [false], published: [true]})
        else
            puts '--- ADMIN is logged in'
            @upcoming_events = @all_events.where("date >= :date and meeting = :meeting", {date: curr_time, meeting: [false]})
        end
        
        @upcoming_events_email = @upcoming_events
        contact_uin_to_email
        
        respond_to do |format|
        	format.html            
        	format.csv { send_data Event.order(:date).all.to_csv, filename: "events-#{Date.today}.csv" }
        end
    end
    
    def new
        grab_officers
    end

    def remove_from_event
        
        if params[:remove_me_location] == "approve_points" # removing member from list from the approval points page
            # if the points are already in the database we need to remove that record as well essentially removing the points fomr that user
            if Point.exists?(:event_id => params[:event_id],:UIN => params[:user_uin])
                Point.find_by(:event_id => params[:event_id],:UIN =>  params[:user_uin]).destroy
            end
        else
            if Attendance.where(:UIN => session[:user_uin]).where(:event_id => params[:event_id]).where(:wait_listed => false).present?
                if Attendance.where(:event_id => params[:event_id]).where(:wait_listed => true).present?
                    @waitlist=Attendance.where(:event_id => params[:event_id]).where(:wait_listed => true)
                    @sorted_waitlist = @waitlist.sort { |a,b| a.time_stamp <=> b.time_stamp }
                    @sorted_waitlist[0].update_attribute :wait_listed, false
                end
            end
        end
        # find out is user is going
            # query grab Attendances.where event_id = id waitlist = true
            # doe the sort
            # make index 0 user waitlist boolean = false
        
        # admin removing member from the attendance list in the approve points page (/points/view_users_approval)
        uin = session[:user_uin]
        if !params[:user_uin].nil? 
            uin = params[:user_uin] 
        end
        
        Attendance.where(:UIN => uin).where(:event_id => params[:event_id]).destroy_all
        
        if !params[:user_uin].nil?
            flash[:success] = "The user was deleted from the event and we removed the points for them!"
            redirect_to points_view_users_approval_path(:event => params[:event_id])
        else
            flash[:success] = "You have been removed from the event!"
            redirect_to :back
        end
        
    end
    
    def destroy
        puts params[:id]
        Attendance.where(:event_id => params[:id]).destroy_all
        Event.find(params[:id]).destroy()
        redirect_to :back
        flash[:success] = "You successfully deleted " + params[:event_name] + "!"
    end
    
    def create
        
        #upload image to cloudinary for storage
        puts "--- image: " + params[:image]
        if !params[:image].empty?
            file_dir = "public/images/" + params[:image]
            Cloudinary::Uploader.upload(file_dir, :use_filename => true, :unique_filename => false)
        end
        
        # convert date input to correct format for database
        date = date_conversion
        
        puts "--- params publish " + params[:publish].to_s
        
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
                 :publish => params[:publish],
                 :image => params[:image])
                 
        @event.save
        
        # make the officer an automatic person on the going list
        @attendance = Attendance.create!(:UIN => params[:contact],
    		:event_id => @event.id,
    		:car_ride => false,
    		:comments => "I am your point of contact for this event",
    		:pref_contact => "Email",
    		:wait_listed => false,
    		:approved => false
    		)
    	@attendance.save
        
        
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
        
        # update the going/waitlist according to the new capacity if it was updated
        if(@event.capacity != params[:capacity])
            update_lists(@event.capacity, params[:capacity], @event.id)
        end
        
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
                 :publish => params[:publish],
                 :image => params[:image])

        flash[:success] = "#{@event.name} was successfully updated."

        redirect_to events_path
    end
    
    private
        def event_params
            params.require(:event).permit(:name, :description, :address, :meeting, :UIN, :date, :start_time, :end_time, :max_points, :contact, :image)
        end
        
        def contact_uin_to_email
            # make the contact attribute represent the EMAIL instead of UIN 
            @upcoming_events_email.each do |event|
                event_contact = User.find_by(UIN: event.contact)
                event.contact = event_contact.email   
            end
        end
        
        def date_conversion
            #convert date input of MM/DD/YYYY to YYYY-MM-DD
            if not params[:date].nil?
                date_arr = params[:date].split('/')
                date = date_arr[2] + '-' + date_arr[0] + '-' + date_arr[1]
            else
                date = "2001-01-01"
            end
            return date
        end
        
        def grab_officers
            @officers = User.where("officer = :officer", {officer: [true]})
        end
        
        def update_lists(old_capacity, new_capacity, event_id)
            
            if(old_capacity > new_capacity.to_i)
                # move ppl from going list to waitlist
                num_records = old_capacity - new_capacity.to_i
                # first just try changing the waitlisted attribute to true
                records_to_waitlist = Attendance.where(:event_id => event_id, :wait_listed => false).last(num_records)

                records_to_waitlist.each do |r|
                    r.update_attributes!(:wait_listed => true)
                end
                
            elsif(old_capacity < new_capacity.to_i)
                # move ppl from wait list to going list
                 num_records = new_capacity.to_i - old_capacity
                # first just try changing the waitlisted attribute to false
                records_to_waitlist = Attendance.where(:event_id => event_id, :wait_listed => true).first(num_records)
                records_to_waitlist.each do |r|
                    r.update_attributes!(:wait_listed => false)
                end
            end
        end
end
