class PointsController < ApplicationController
    
    def create
        # # point = Point.create!(:event_id => params[:meeting_id],
        # #                       :points => points,
        # #                       :UIN => params[:uin],
        # #                       :issue_date => issue_date)
        # puts "------------- CREATE"
        # point = Point.create!(params[:points_params])
        # point.save
        # puts "-------------- SAVE"
            
        # flash[:success] = name + " has successfully signed in"
        # puts "-------------- REDIRECT"
        # redirect_to events_meeting_signin
    end
    
    
    def meeting
        curr_time = DateTime.now.to_date
        all_events = Event.all
        # populate dropdown list
        @upcoming_meetings = all_events.where("date >= :date and meeting = :meeting", {date: curr_time, meeting: [true]})
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
    
    
    UserAttendance = Struct.new(:active_record, :name)
    
    def view_users_approval
        @user_attendance = Attendance.where("event_id = :event_id and approved = :approved and wait_listed = :wait_listed", {event_id: params[:event], approved: [false], wait_listed: [false]})
        @event = Event.find(params[:event])
        
        @users = Array.new
        
        puts "user_attendance: "
        @user_attendance.each do |user_att|
            uin = user_att.UIN
            puts "--- uin:" + uin.to_s
        end
        
        @user_attendance.each do |user_att|
            uin = user_att.UIN
            user = User.find_by(UIN: uin)
            
            @users.append(UserAttendance.new(user_att, user.name))
        end
        
        @users.each do |user|
            puts "--- user name:" + user[:name]
            puts "--- user uin:" + user[:active_record].UIN.to_s
        end
        
        if @users.nil? then puts "USERS IS FUCKING NIL" end 
        if !@users.nil? then puts "USERS IS OK" end 
        
        # redirect_to view_users_approval(:event_id => meeting, :event_name => meeting.name)
    end
    
    def approve_points
        
    end
end
