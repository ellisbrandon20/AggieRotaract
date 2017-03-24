class AttendancesController < ApplicationController
    UpcomingEventData = Struct.new(:active_record, :wait_list_pos)
    
    def index
        curr_time = DateTime.now.to_date
        all_attendances = Attendance.all
        all_events = Event.all
        
        events_user_attd = Array.new
        
        all_attendances.each do |event|
            puts "\nAdding an attendance\n"
            puts "Event UIN"
            puts event.UIN
            puts "Session UIN"
            puts session[:user_uin]
            
            if event.UIN == session[:user_uin].to_i then
                puts "\nAppending...\n"
                events_user_attd.append(event.id)
            end

        end
        
        
        
        
        
        usr_upcoming_events = Event.find(events_user_attd)
        puts usr_upcoming_events.length
        @user_upcoming_events = Array.new
        
        usr_upcoming_events.each do |evnt|
            
            waitlist_position = 1
            @user_upcoming_events.append(UpcomingEventData.new(evnt,waitlist_position))
        end
        
        puts @user_upcoming_events.length
    
    end
end
