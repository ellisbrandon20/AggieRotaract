class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper :all
  helper_method :redirect_to
  
  protected
  def authenticate_user!
    if session[:user_uin].nil? and session[:admin].nil?
       redirect_to root_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
end