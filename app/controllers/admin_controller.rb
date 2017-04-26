class AdminController < ApplicationController
    
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