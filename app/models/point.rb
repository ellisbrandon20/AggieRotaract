require 'csv'
class Point < ApplicationRecord
    def self.to_csv
        CSV.generate(headers: true) do |csv|
            csv << %w{ event member points issue_date } 
            all.each do |rec|
                # Event Name
                event_name = Event.find(rec.event_id).name
                # User Name
                member = User.find_by(:UIN => rec.UIN).name
                
                csv << [ event_name, member, rec.points, rec.issue_date]
            end
        end
    end
end
