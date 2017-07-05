require 'csv'
class Attendance < ApplicationRecord
    def self.to_csv
        CSV.generate(headers: true) do |csv|
            csv << %w{ member event wait_listed comments contact_method car_ride approved time_stamp} 
            all.each do |rec|
                # Event Name
                event_name = Event.find(rec.event_id).name
                # User Name
                member = User.find_by(:UIN => rec.UIN).name
                
                csv << [ member, event_name, rec.wait_listed, rec.comments, rec.pref_contact, rec.car_ride, rec.approved, rec.time_stamp]
            end
        end
    end
end
