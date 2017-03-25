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
		@attendance = Attendance.new
    	@attendance = Attendance.create!(:UIN => session[:user_uin],
    		:event_id => params[:event_id],
    		:car_ride => params[:car_ride],
    		:comments => params[:comment]
    		)
    	if @attendance.save
    		flash.notice = "You are registered!"
      		redirect_to events_path
    	else
      		render action: 'new'
    	end
	end
end