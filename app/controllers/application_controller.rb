class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper :all
  helper_method :redirect_to
end