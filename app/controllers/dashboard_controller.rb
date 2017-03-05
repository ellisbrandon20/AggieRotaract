class DashboardController < ApplicationController
  def index
    if !session[:admin]
      
      @user = User.find_by(:UIN => session[:user_uin])
    end
  end
end
