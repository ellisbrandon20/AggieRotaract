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
    
  EventData = Struct.new(:id, :name, :address, :date, :description, :start_time, :end_time, :capacity, :max_points, :meeting, :contact, :image)
  def event_data_conversion data
    # convert necessary columns to human readable content
		@events.each do |row|
			#date
			date = row.date.strftime("%B %d, %Y") 
			
			#time
			start_time = row.start_time.strftime("%I:%M %p")
        	end_time = row.end_time.strftime("%I:%M %p")
			
			#contact UIN to name
			contact = User.find_by(UIN: row.contact).name
            
      data.append(EventData.new(row.id, row.name, row.address, date, row.description, start_time, end_time, row.capacity, row.max_points, row.meeting, contact, row.image))
		end
  end
end