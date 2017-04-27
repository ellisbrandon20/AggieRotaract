module ApplicationHelper
	def flash_class(level)
		case level.to_sym
		    when :notice then "alert alert-info"
		    when :success then "alert alert-success"
		    when :error then "alert alert-error"
		    when :alert then "alert alert-error"
		    when :danger then "alert alter-danger"
    	end
	end
	
	def member_redirect
		if (session[:admin] == false)
			redirect_to dashboard_index_path
		end
	end
end
