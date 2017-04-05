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
end
