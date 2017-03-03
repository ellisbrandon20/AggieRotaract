class UserController < ApplicationController
	def login
		user_uin = params[:login_UIN]
		if User.exists?({:UIN => user_uin})
			puts("------------------------")
			puts("USER EXISTS")
		else
			puts("------------------------")
			puts("USER DOES NOT EXISTS")
		end
		
		
		
	end

	
end
