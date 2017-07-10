class AdminController < ApplicationController
    before_filter :authenticate_user!
        		
    # special structs    		

    
    def export_data
    	@data = Array.new
    	if params[:option] == '1'
    		@events = Event.order(:date).all
    		@data = event_data_conversion()
    	elsif params[:option] == '2'
    		@events = Attendance.order(:event_id).all
    		@data = get_attendances_data()
    	elsif params[:option] == '3'
    		TODO
    		@header = get_users_header()
    		@data = get_users_data()
    	elsif params[:option] == '4'
    		TODO
    		@header = get_points_header()
    		@data = get_points_data()
    	end
    end
    
    def edit
       @record = Admin.find(params[:id]) 
       
    end
    
    def update
    	@record = Admin.find(1)
		if params[:new_admin_password1] == params[:new_admin_password2] and Digest::SHA2.hexdigest(params[:old_admin_password]) == @record.password
			
			puts 'Change Password'
			@record.update_attributes!(:password => Digest::SHA2.hexdigest(params[:new_admin_password1]))
			flash[:success] = "Password Successfully Changed."
			redirect_to dashboard_index_path
			
		else
			if params[:new_admin_password1] != params[:new_admin_password2]
			    flash[:danger] = "Mismatching New Passwords."
			else
			    flash[:danger] = "Invalid Old Password."
			end
			redirect_to edit_admin_path
		end 
    end
    
    
    def show
    end
    
    
    private
    
    def get_event_data
    
    end
end
