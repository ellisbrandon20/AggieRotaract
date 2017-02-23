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
           :start_time => '10:00:00', :end_time => '15:00:00', :capacity => 30, :max_points => 3.0, 
           :meeting => false, :contact => 123456789, :image => '/app/assets/images/big_event.jpeg'},
           
          {:name => 'Habitat for Humanity', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
           :description => 'Aggie Habitat for Humanity is the Texas A&M Campus Chapter of Habitat for Humanity International. We work closely with Bryan/College Station Habitat for Humanity.',
           :start_time => '09:00:00', :end_time => '13:00:00', :capacity => 25, :max_points => 2.0, 
           :meeting => false, :contact => 987654321, :image => '/app/assets/images/habitat_for_humanity.jpeg'}
         ]
         

events.each do |event|
    Event.create!(event)
end
