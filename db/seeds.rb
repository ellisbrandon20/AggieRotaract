# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

events = [
          {:name => 'Big Event', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
          :description => 'Since its introduction in 1982, The Big Event has become the largest, one-day, student-run service project in the nation. Each spring, tens of thousands of Texas A&M students come together to say "Thank You" to the residents of Bryan and College Station. For the past 33 years, Aggie students have participated in this annual event to show their appreciation to the surrounding community, completing service projects such as yard work, window washing, and painting for residents of the community. Although The Big Event has become the largest one-day, student-run service project in the nation, our message and our mission remains the same – to simply say “Thank You.”',
          :date => '2017-03-15',:start_time => '10:00:00', :end_time => '15:00:00', :capacity => 30, :max_points => 3.0, 
          :meeting => false, :contact => 123456789, :image => 'big_event.jpeg'},
           
          {:name => 'Habitat for Humanity', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
          :description => 'Aggie Habitat for Humanity is the Texas A&M Campus Chapter of Habitat for Humanity International. We work closely with Bryan/College Station Habitat for Humanity.',
          :date => '2017-04-01', :start_time => '09:00:00', :end_time => '13:00:00', :capacity => 25, :max_points => 2.0, 
          :meeting => false, :contact => 987654321, :image => 'habitat_for_humanity.jpeg'},
          
          {:name => 'GigEm Week', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
           :description => 'Since its introduction in 1982, The Big Event has become the largest, one-day, student-run service project in the nation. Each spring, tens of thousands of Texas A&M students come together to say "Thank You" to the residents of Bryan and College Station. For the past 33 years, Aggie students have participated in this annual event to show their appreciation to the surrounding community, completing service projects such as yard work, window washing, and painting for residents of the community. Although The Big Event has become the largest one-day, student-run service project in the nation, our message and our mission remains the same – to simply say “Thank You.”',
           :date => '2017-03-01',:start_time => '10:00:00', :end_time => '15:00:00', :capacity => 30, :max_points => 3.0, 
           :meeting => false, :contact => 123456789, :image => 'big_event.jpeg'},
           
            {:name => 'Today', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
           :description => 'Since its introduction in 1982, The Big Event has become the largest, one-day, student-run service project in the nation. Each spring, tens of thousands of Texas A&M students come together to say "Thank You" to the residents of Bryan and College Station. For the past 33 years, Aggie students have participated in this annual event to show their appreciation to the surrounding community, completing service projects such as yard work, window washing, and painting for residents of the community. Although The Big Event has become the largest one-day, student-run service project in the nation, our message and our mission remains the same – to simply say “Thank You.”',
           :date => '2017-03-01',:start_time => '10:00:00', :end_time => '15:00:00', :capacity => 30, :max_points => 3.0, 
           :meeting => false, :contact => 123456789, :image => 'big_event.jpeg'}
         ]
         

events.each do |event|
    Event.create!(event)
end

users = [
  {:UIN => 123456789, :name => "Carlos Cardin", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => true, :active => true
  },
  {:UIN => 987654321, :name => "Brandon Ellis", :phone => "0987654321", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => true, :active => true
  }
]


users.each do |user|
    User.create!(user)
end

attendances = [
    {:UIN => 123456789, :car_ride => 0, :comments => "fun fun fun", :wait_listed => 1, :event_id => 1, :time_stamp => '2017-03-01'},
    {:UIN => 123456789, :car_ride => 0, :comments => "more fun fun fun", :wait_listed => 1, :event_id => 2, :time_stamp => '2017-03-01'}
]

attendances.each do |attendance|
    Attendance.create!(attendance)
end