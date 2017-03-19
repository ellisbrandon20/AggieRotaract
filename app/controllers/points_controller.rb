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
        #grab uin
        user_uin = params[:uin]
        
        #check to see if UIN exists
        if User.exists?({:UIN => user_uin})
            # add user to meeting
            name = User.find_by({:UIN => user_uin}).name
            meeting = Event.find(params[:meeting_id])
            points = meeting.max_points
            issue_date = DateTime.now.to_date
            
            points_params = [meeting.id, points, user_uin, issue_date]
            
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
        end
            
    end
    
    def show
    end
end
