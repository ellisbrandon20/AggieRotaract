class AttendancesController < ApplicationController
	def index
	end

	def new
		@attendance = Attendance.new
		@attendance.user = current_user
		@attendance.event = Attendance.find(params[:event_id])
	end

	def create
		@attendance = Attendance.new
    	@attendance = Attendance.create!(:UIN => params[:user_uin],
    		:event_id => 0,
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