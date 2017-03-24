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
    	@attendance.user = current_user
    	@attendance.event = Attendance.find(params[:event_id])
    	if @attendance.save
      		redirect_to events_path, notice: "You are registered!"
    	else
      		render action: 'new'
    	end
	end
end