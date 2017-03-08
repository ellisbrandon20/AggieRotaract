class AttendancesController < ApplicationController
    def index
        curr_time = DateTime.now.to_date
        @all_events = Event.all
        @upcoming_events = @all_events.where("date >= :date and meeting = :meeting", {date: curr_time, meeting: [false]})
        @upcoming_events_email = @upcoming_events
        #contact_uin_to_email
    end
end
