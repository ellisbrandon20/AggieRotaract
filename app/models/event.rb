require 'csv'
class Event < ApplicationRecord
    def self.to_csv
        CSV.generate(headers: true) do |csv|
            csv << %w{ id name address description start_time end_time capacity max_points meeting contact image } 
            all.each do |event|
                event_contact = User.find_by(UIN: event.contact)
                contact_name = event_contact.name 
                csv << [event.id, event.name, event.address, event.description, event.start_time, event.end_time, event.capacity, event.max_points, event.meeting, contact_name, event.image ]
            end
        end
    end
end
