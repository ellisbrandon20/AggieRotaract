require 'csv'
class Event < ApplicationRecord
    def self.to_csv
        CSV.generate(headers: true) do |csv|
            csv << %w{ id name address date description start_time end_time capacity max_points meeting contact image } 
            all.each do |event|
                #date
    			date = event.date.strftime("%B %d, %Y") 
    			
    			#time
    			start_time = event.start_time.strftime("%I:%M %p")
            	end_time = event.end_time.strftime("%I:%M %p")
    			
    			#contact UIN to name
    			contact = User.find_by(UIN: event.contact).name 
                csv << [event.id, event.name, event.address, date, event.description, start_time, end_time, event.capacity, event.max_points, event.meeting, contact, event.image ]
            end
        end
    end
end
