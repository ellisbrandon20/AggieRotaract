class AdminController < ApplicationController
    before_filter :authenticate_user!
    
    def export_data
    	# if 1
    	# 	@header = get_event_header()
    	# 	get_event_data()
    	# elsif 2
    	# 	@header = get_attendances_header()
    	# 	get_attendances_data()
    	# elsif 3
    	# 	@header = get_users_header()
    	# 	get_users_data()
    	# elsif 4
    	# 	@header = get_points_header()
    	# 	get_points_data()
    	# end
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
end
