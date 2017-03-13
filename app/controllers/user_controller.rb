class UserController < ApplicationController
	layout "login"
	
	def login
		# check if admin or member is trying to login
		if params[:login_UIN] == "admin"
			# ask for password
			redirect_to user_admin_login_path
		elsif !params[:login_UIN].nil?
			# member login
			user_uin = params[:login_UIN]
			if User.exists?({:UIN => user_uin}) #and !user_uin.nil?
				
				# if uin is correct assign this session variable for use in other areas in application
				session[:user_uin] = user_uin
				# to correctly display certain buttons
				session[:admin] = false
				
				# successful login redirect to dashbaord path
				redirect_to dashboard_index_path
			else
				# uin does not exist in database
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
	
	def new
		# creates the correct "Go Back" link for user creation since we use the form in 2 different locations: Login, Meeting Sign In
		session[:new_user_back] = URI(request.referer || '').path
	end
	
	def create
		address = params[:street] + ' ' + params[:city] + ', ' + params[:state] + ' ' + params[:zip]
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
		
		#redirect_to root_path
		redirect_to session[:new_user_back]
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
