class AttendancesController < ApplicationController
    def index
        curr_time = DateTime.now.to_date
        @all_attendances = Attendance.all
        @all_events = Event.all
        
        @events_user_attd = Array.new
        
        @all_attendances.each do |event|

            if event.UIN == session[:user_uin].to_i then
                @events_user_attd.append(event.id)
            end

        end
        
        @user_upcoming_events = Event.find(@events_user_attd)
    
    end
end
