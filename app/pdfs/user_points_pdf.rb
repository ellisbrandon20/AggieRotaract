class UserPointsPdf < Prawn::Document
    def initialize points, user_uin
        @points = points
        super()
        
        # Title/Header
        text "Aggie Rotaract Approved User Points", :size => 25, :align => :center
        
        # todays date right aligned
        text Date.today.strftime("%B %d, %Y"), :align => :right
        
        # User and points
        text User.find_by(UIN: user_uin).name
        
        @points.each do |event|
            # Event Name
            # event_name = Event.find(rec.event_id).name
            text event[:event].name
        end
    end
end