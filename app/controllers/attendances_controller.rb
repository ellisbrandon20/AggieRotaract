class AttendancesController < ApplicationController
	def index
        @all_attendance = Attendance.all
	end
	def new
		@attendance = Attendance.new
		@attendance.user = current_user
		@attendance.event = Attendance.find(params[:event_id])
	end

	def create
		
		# determine if user is on going list or waitlisted
		
		
		
    	@attendance = Attendance.create!(:UIN => session[:user_uin],
    		:event_id => params[:event_id],
    		:car_ride => params[:car_ride],
    		:comments => params[:comment],
    		:pref_contact => params[:pref_contact]
    		)
    	if @attendance.save
    		flash.notice = "You are registered!"
      		redirect_to events_path
    	else
      		render action: 'new'
    	end
	end

    UpcomingEventData = Struct.new(:active_record, :wait_list_pos)
    
    def index
        @user = User.find_by(UIN: session[:user_uin])
        
        # grab all attendances data
        all_attendances = Attendance.all
        
        # array of event id's that user X is signed up for 
        events_user_attd = Array.new
        
        # find instances where user X is signed up for an event
        all_attendances.each do |attendance_row|
            # puts "\nAdding an attendance\n"
            # puts "Event UIN"
            # puts event.UIN
            # puts "Session UIN"
            # puts session[:user_uin]
            
            if attendance_row.UIN == session[:user_uin].to_i then
                puts "\nAdding Event ID to Upcoming Event List\n"
                events_user_attd.append(attendance_row.event_id)
            end
        end
        
        
        # find all instances of Events with event id's "events_user_attd" (array of ids)
        usr_upcoming_events = Event.find(events_user_attd)
        
        # convert uin to name from the Events model
        usr_upcoming_events = contact_uin_to_name(usr_upcoming_events)
        
        #Calculate the waitlist position
        
        # array to store the Event Information, and whether the user is "waitlisted" or "going"
        @user_upcoming_events = Array.new
        usr_upcoming_events.each do |event|
            
            
        
            
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

        puts "User upcoming events length"
        puts @user_upcoming_events.length
    end
    
    def show
    end
    
    
    private
        def contact_uin_to_name(usr_upcoming_events)
            # make the contact attribute represent the EMAIL instead of UIN 
            usr_upcoming_events.each do |event|
                event_contact = User.find_by(UIN: event.contact)
                puts event_contact.name
                event.contact = event_contact.name
            end
            return usr_upcoming_events
        end
end
