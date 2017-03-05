class UserController < ApplicationController
	layout "login"
	
	def login
		user_uin = params[:login_UIN]
		admin = false;
		
		# error check for input of 9 digits if not redirect to login page sending error in address bar like: ?login_error=somthing
		# redirect_to root_path(:login_error => "invalid_input")
		
		# if the text "admin" is entered then do something to ask for password then check that make sure it is correct
		# if password is incorrect
			# redirect_to root_path(:login_error => "invalid_password")
		if params[:login_UIN] == "admin"
			puts("dang you're an admin")
			admin = true;
		end
		
		# if admin we need to run this and then redirect to dashboard and skip the below if code (line 18) checking for user in the database
			# session[:admin] = true
		# else
			# session[:admin] = false
		# this is what we will use throughout the applicaiton to control which buttons and layouts are viewable ot the user
		if admin
			puts("about to redirect to admin path")
			redirect_to user_admin_login_path
		elsif !user_uin.nil?
			if User.exists?({:UIN => user_uin}) #and !user_uin.nil?
				puts(user_uin)
				puts("------------------------")
				puts("USER EXISTS")
				
				# if uin is correct assign this session variable
				session[:user_uin] = user_uin
				session[:admin] = false
				# the session variable is used to control which users data to display like their points and etc.
				
				# successful login redirect to dashbaord path
				redirect_to dashboard_index_path
				
				
			else
				puts(user_uin)
				puts("------------------------")
				puts("USER DOES NOT EXISTS")
				
				# error input or user does not exist, send an error back to login page in the address bar like: ?login_error=something
				flash[:warning] = "Invalid UIN. Do you need to Sign Up?"
				redirect_to root_path(:login_error => "invalid_user")
			end
		end
		
	end

	def admin_password_validation
		password = "password"
		if params[:admin_password] == password
			# redirect_to root_path(:login_error => "invalid_password")
			session[:admin] = true
			redirect_to dashboard_index_path
		else
			flash[:error] = "Incorrect Admin password."
			redirect_to root_path
		end
	end
	
	def create
		address = params[:street] + ' ' + params[:city] + ', ' + params[:state] + ' ' + params[:zip]
		# this is the method that is to be called when signing up a new member
		@new_user = User.create!(:name => params[:name],
                 :UIN => params[:UIN],
                 :phone => params[:phone],
                 :email => params[:email],
                 :address => address,
                 :classification => params[:classification],
                 :major => params[:major],
                 :shirt => params[:shirt],
                 :gender => params[:gender],
                 :officer => false,
                 :active => true)
                 
        @new_user.save
		flash[:success] = "Created User: " + @new_user.name
		redirect_to root_path
	end

	def logout
		# action that is called when logout button is clicked
		# should be clearing necessary information like this, not sure if we need anything else for now this is enough
		session[:user_uin] = nil
		session[:admin] = nil
		puts "redirect to path"
		flash[:success] = "Successfully logged out."
		redirect_to root_path
	end
	
end
