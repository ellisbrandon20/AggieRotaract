class UserPointsPdf < Prawn::Document
    def initialize points, user_uin
        @points = points
        super()
        
        # Title/Header
        pad_bottom(25) {text "Aggie Rotaract Approved User Points", :size => 25, :align => :center}
        
        # todays date right aligned
        text Date.today.strftime("%B %d, %Y"), :align => :right 
        
        # User name
        text User.find_by(UIN: user_uin).name

        # User's Points
        total = 0
        @points.each do |event|
            total = total + event[:active_record].points
        end
        pad_bottom(10) {text total.to_s + " points"}
        
        @points.each do |event|
            stroke_horizontal_rule
            index = 1
            pos = 100
            # pad(20) { 
                ## Left Aligned
                bounding_box([0, y-(index*pos)], :width => 250, :height => 220) do
                    # Event Name
                    text event[:event].name 
                    
                    # Event Points Earned
                    text "Possible Points: " + event[:event].max_points.to_s
                    text "Points Earned: " + event[:active_record].points.to_s

                    # Event Time
                    text "Time: " + event[:event].start_time.strftime("%I:%M %p") + "-" + event[:event].end_time.strftime("%I:%M %p")
                    
                    # Event Date
                    text "Date: " + event[:event].date.strftime("%B %d, %Y")

                    # Event Contact
                    contact_email = User.find_by(UIN: event[:event].contact).email
                    text "Contact: " + contact_email
                    
                    # Event Description
                    text "Description:"
                    text event[:event].description
                end

                ## Right Aligned
                    # Event Image?????
                    # Event Address


            # }



            stroke_horizontal_rule
            index = index + 1
        end
    end
end