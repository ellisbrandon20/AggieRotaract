class PointsController < ApplicationController
    # struct
    UserPoints = Struct.new(:active_record, :event)
    
    def index

        @events = Array.new

        #session user uin
        @users_points = Point.where(UIN: session[:user_uin])
        #  event_id, points, uin, issue_date    
        @users_points.each do |user_pt|
            event = Event.find(user_pt.event_id)

            @events.append(UserPoints.new(user_pt, event))
        end


        if !params[:view_event].nil?
            @view_event = Event.find(params[:view_event])
            event_contact = User.find_by(UIN: @view_event.contact)
            @view_event.contact = event_contact.email 
        end
    end

    def create
        
        
        
        @user_uin = params[:user_uin]
        @user_points = params[:points]
        
        # loops through both arrays pairing the values by index
        # or if looking at the table on website then it is by row matching the uin and the points
        @user_uin.zip(@user_points).each do |uin, points|
            curr_time = DateTime.now.to_date
            
            # if admin resubmits the form we need to overwrite the data in there not append
            if Point.exists?(:event_id => params[:event_id],:UIN => uin)
                Point.find_by(:event_id => params[:event_id],:UIN => uin).destroy
            end
            
            @point = Point.create!(:event_id => params[:event_id],
                                    :UIN => uin,
                                    :points => points,
                                    :issue_date => curr_time)
            
            @point.save
                
            # set the approved variable to true in Attendance model
            @attendance_record = Attendance.find_by(UIN: uin, event_id: params[:event_id])
            @attendance_record.update_attribute(:approved, true)
            @attendance_record.save
        end
     
        flash[:success] = "Points were successfully distributed"
    
        redirect_to points_view_users_approval_path(:event => params[:event_id])
    end
    
    
    def meeting
        curr_time = DateTime.now.to_date
        all_events = Event.all
        all_points = Point.all
        # populate dropdown list
        @upcoming_meetings = all_events.where("date >= :date and meeting = :meeting", {date: curr_time, meeting: [true]})
        @user_points = Point.all.where(:UIN => session[:user_uin])
    end
    
    def meeting_signin
        if params[:meeting_id].nil?
            flash[:danger] = "Sorry, you did not select a meeting!"
            redirect_to points_meeting_path
        else
            #grab uin
            user_uin = params[:uin]
            
            #check to see if UIN exists
            if User.exists?({:UIN => user_uin})
                # add user to meeting
                name = User.find_by({:UIN => user_uin}).name
                meeting = Event.find(params[:meeting_id])
                points = meeting.max_points
                issue_date = DateTime.now.to_date
                
                point = Point.create!(:event_id => params[:meeting_id],
                                      :points => points,
                                      :UIN => params[:uin],
                                      :issue_date => issue_date)
                                      
                point.save
                flash[:success] = name + " has successfully signed in"
                
                redirect_to points_meeting_path(:event_id => meeting, :event_name => meeting.name)
                
            else
                #if not, offer to create new user
                flash[:warning] = "Invalid UIN. Do you need to Sign Up?"
                puts "------------------------- user does not exists"
                redirect_to points_meeting_path
            end
        end      
    end
    
    def show
    end
    
    def select_approve_points
        curr_time = DateTime.now.to_date
        @past_events = Event.where("date <= :date and meeting = :meeting", {date: curr_time, meeting: [false]})
        
    end
    
    
    UserAttendance = Struct.new(:active_record, :name, :points)
    
    def view_users_approval
        # @user_attendance = Attendance.where("event_id = :event_id and approved = :approved and wait_listed = :wait_listed", {event_id: params[:event], approved: [false], wait_listed: [false]})
        @user_attendance = Attendance.where("event_id = :event_id and wait_listed = :wait_listed", {event_id: params[:event], wait_listed: [false]})
        @event = Event.find(params[:event])
        
        @users = Array.new
        
        @user_attendance.each do |user_att|
            uin = user_att.UIN
            user = User.find_by(UIN: uin)
            # @points = Point.where("event_id = :event_id", {event_id: params[:event]})
            points_record = Point.find_by(event_id: params[:event], UIN: uin)
            
            if points_record.nil?
                @users.append(UserAttendance.new(user_att, user.name, 0))
            else
                @users.append(UserAttendance.new(user_att, user.name, points_record.points))
            end 
        end
    end
    
    MemberActivity = Struct.new(:event,:points)
    
    def member_activity_table
        
        #@upcoming_meetings = all_events.where("date >= :date and meeting = :meeting", {date: curr_time, meeting: [true]})
        #@user_points = Point.all.where(:UIN => session[:user_uin])
        
        my_attendances = Point.all.where("UIN = :UIN",{UIN: 123456789})
        
        @events = []
        
        my_attendances.each do |attendance|
            @events.append(Event.find(attendance.event_id))
        end
        
        
        
        #@events = Event.all.where("UIN = :UIN",{UIN: 123456789})
    end

end
