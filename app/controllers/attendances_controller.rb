class AttendancesController < ApplicationController
    UpcomingEventData = Struct.new(:active_record, :wait_list_pos)
    
    def index
        @user = User.find_by(UIN: session[:user_uin])
        curr_time = DateTime.now.to_date
        
        # grab all attendances data
        all_attendances = Attendance.all
        
        # array of event id's that user X is signed up for 
        events_user_attd = Array.new
        
        # find instances where user X is signed up for an event
        all_attendances.each do |attendance_row|
            
            if attendance_row.UIN == session[:user_uin].to_i then
                events_user_attd.append(attendance_row.event_id)
            end
        end
        
        
        # find all instances of Events with event id's "events_user_attd" (array of ids)
        usr_upcoming_events = Event.find(events_user_attd)
        
        # convert uin to name from the Events model
        usr_upcoming_events = contact_uin_to_email(usr_upcoming_events)
        
        #Calculate the waitlist position
        
        # array to store the Event Information, and whether the user is "waitlisted" or "going"
        @user_upcoming_events = Array.new
        
        #loop through each attendances of the current user to calculate their waitlist
        usr_upcoming_events.each do |event|
        
            if(event.date >= curr_time)
                #Get all attendance for this event
                attendances_for_event = all_attendances.find_all {|x| x.event_id == event.id}
                puts "Attendances for event"
                puts attendances_for_event.size
                attendances_for_event.each do |att|
                    puts att.UIN
                end
                
                #Get all wait listed atendances for this event
                waitlisted_attendances_for_event = attendances_for_event.find_all {|x| x.wait_listed == true}
                puts "Waitlisted attendances for event"
                waitlisted_attendances_for_event.each do |att|
                    puts att.UIN
                end
                
                #sort by the time
                sorted_waitlisted_attendances_for_event = waitlisted_attendances_for_event.sort! { |a,b| a.time_stamp <=> b.time_stamp }
                puts "Sorted Waitlisted attendances for event"
                sorted_waitlisted_attendances_for_event.each do |att|
                    puts att.UIN
                end
                
                index = sorted_waitlisted_attendances_for_event.index{|x| x.UIN == session[:user_uin].to_i}
                
                puts "Index" + index.to_s
                
                if !index.nil?
                    waitlist_position = index + 1
                else
                    waitlist_position = 0
                end
                
                # this variable will work like a hash 
                    # ":active_record" gets you the Event info and 
                    # ":wait_list_pos" tells you if the user is "going" or "waitlisted"
                    
                @user_upcoming_events.append(UpcomingEventData.new(event,waitlist_position))
            end
        end

        # sort the events by date
        @user_upcoming_events.sort! {|a, b| a.active_record.date <=> b.active_record.date}
    end
  
	def new
        @all_users = User.order('name').all
        puts params[:event_id]
	end

	def create
		# determine if user is on going list or waitlisted
		@current_event=Event.find(params[:event_id])
		if params[:wait_list].nil?
		    if number_people_registered < @current_event.capacity
    		    @waiting = false
    		else
    		    @waiting = true
    		end
    	else
    	    @waiting = false
    	end
		
		# params[:user] comes from /attendances/new when admin is adding an entry for 
        # approving points for user that attended event but that was not signed up for
        uin = session[:user_uin]
		if session[:admin] then uin = params[:user] end
		
    	@attendance = Attendance.create!(:UIN => uin,
    		:event_id => params[:event_id],
    		:car_ride => params[:car_ride],
    		:comments => params[:comment],
    		:pref_contact => params[:pref_contact],
    		:wait_listed => @waiting,
    		:approved => false
    		)
    	if @attendance.save
    		flash[:success] = "You are registered!"
    	else
    	    flash[:danger] = "Try again we could not save that record"
    	end
    	
    	if session[:admin]
    	    # action called by admin to add member to attendance record post event
    	    redirect_to points_view_users_approval_path(:event => params[:event_id])
    	else
    	    # action called by users when signing up for event
    	    redirect_to events_path
    	end
    	
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
        # session[:remove_me_back] = URI(request.referer || ‘’).path
    end
    
    def edit
        @selected_attd = Attendance.find_by(:UIN => session[:user_uin], :event_id => params[:id])  
    end
    
    def update
        @attendance = Attendance.find(params[:id])
        @attendance.update_attributes!(:UIN => session[:user_uin],
    		:event_id => @attendance.event_id,
    		:car_ride => params[:car_ride],
    		:comments => params[:comment],
    		:pref_contact => params[:pref_contact],
    		:wait_listed => @attendance.wait_listed,
    		:approved => @attendance.approved)
        flash[:success] = "Your comments were successfully updated."
        redirect_to dashboard_index_path
    end
    
    def show
    end
    
    def number_people_registered
        @count=Attendance.where(event_id: params[:event_id]).count
        puts @count
        return @count
    end
    
    Attendees = Struct.new(:active_record, :attendee)
    
    def event_attendees
        @attendees = Array.new

        #session user uin
        @attendances=Attendance.where(event_id: params[:event_id])    
        @attendances.each do |attendance|
            attendee = User.find_by(UIN: attendance.UIN)

            @attendees.append(Attendees.new(attendance, attendee))
        end
    end
    
    
    ViewDetailsData = Struct.new(:active_record, :user)
    def view_details
        # grab the event details
        @event = Event.find(params[:event_id])
        
        # grab the going list
        @going_list = Attendance.where("event_id = :event_id and wait_listed = :wait_listed", {event_id: params[:event_id], wait_listed: [false]})
        @going = Array.new
        @going_list.each do |att|
            user = User.find_by(UIN: att.UIN)
            @going.append(ViewDetailsData.new(att, user))
        end
        
    end
    
    private
        def contact_uin_to_email(usr_upcoming_events)
            # make the contact attribute represent the EMAIL instead of UIN 
            usr_upcoming_events.each do |event|
                event_contact = User.find_by(UIN: event.contact)
                puts event_contact.name
                event.contact = event_contact.email
            end
            return usr_upcoming_events
        end
end
