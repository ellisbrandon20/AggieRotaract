require 'csv'
class Attendance < ApplicationRecord
    def self.to_csv
        CSV.generate(headers: true) do |csv|
            csv << %w{ event member car_ride comments wait_listed contact_method approved} 
            all.each do |rec|
                # Event Name
                event_name = Event.find(rec.event_id).name
                # User Name
                member = User.find_by(:UIN => rec.UIN).name
                
                csv << [ event_name, member, rec.car_ride, rec.comments, rec.wait_listed, rec.pref_contact, rec.approved]
            end
        end
    end
end
