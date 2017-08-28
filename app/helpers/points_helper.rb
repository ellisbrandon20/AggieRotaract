module PointsHelper
    
    def is_user_active uin
        puts "-- uin " + uin.to_s
        @records = Point.where(:UIN => uin)
        total = 0
        @records.each do |rec|
            total = total + rec.points
        end
        
        puts "--- points: " + total.to_s
        
        if total >= 30
            puts "--- user is active! "
            return true
        else
            puts "--- user is NOT active! "
            return false
        end
        
    end
    
end
