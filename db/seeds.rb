# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Iteration 1
            
            events = [
                      {:name => 'Big Event', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
                      :description => 'Since its introduction in 1982, The Big Event has become the largest, one-day, student-run service project in the nation. Each spring, tens of thousands of Texas A&M students come together to say "Thank You" to the residents of Bryan and College Station. For the past 33 years, Aggie students have participated in this annual event to show their appreciation to the surrounding community, completing service projects such as yard work, window washing, and painting for residents of the community. Although The Big Event has become the largest one-day, student-run service project in the nation, our message and our mission remains the same – to simply say “Thank You.”',
                      :date => '2017-12-15',:start_time => '10:00:00', :end_time => '15:00:00', :capacity => 30, :max_points => 3.0, 
                      :meeting => false, :contact => 123456789, :image => 'big_event.jpeg', :publish => true},
                       
                      {:name => 'Habitat for Humanity', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
                      :description => 'Aggie Habitat for Humanity is the Texas A&M Campus Chapter of Habitat for Humanity International. We work closely with Bryan/College Station Habitat for Humanity.',
                      :date => '2017-11-16', :start_time => '09:00:00', :end_time => '13:00:00', :capacity => 25, :max_points => 2.0, 
                      :meeting => false, :contact => 987654321, :image => 'habitat_for_humanity.jpeg', :publish => true},
                      
                      # events to test approve points 
                      {:name => 'past event 1', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
                      :description => 'Since its introduction in 1982, The Big Event has become the largest, one-day, student-run service project in the nation. Each spring, tens of thousands of Texas A&M students come together to say "Thank You" to the residents of Bryan and College Station. For the past 33 years, Aggie students have participated in this annual event to show their appreciation to the surrounding community, completing service projects such as yard work, window washing, and painting for residents of the community. Although The Big Event has become the largest one-day, student-run service project in the nation, our message and our mission remains the same – to simply say “Thank You.”',
                      :date => '2017-05-01',:start_time => '10:00:00', :end_time => '15:00:00', :capacity => 30, :max_points => 3.0, 
                      :meeting => false, :contact => 123456789, :image => 'big_event.jpeg', :publish => true},
                       
                      {:name => 'past event 2', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
                      :description => 'Aggie Habitat for Humanity is the Texas A&M Campus Chapter of Habitat for Humanity International. We work closely with Bryan/College Station Habitat for Humanity.',
                      :date => '2017-05-02', :start_time => '09:00:00', :end_time => '13:00:00', :capacity => 25, :max_points => 2.0, 
                      :meeting => false, :contact => 987654321, :image => 'habitat_for_humanity.jpeg', :publish => true},
                      
                      # event to test signup waitlist feature
                      {:name => 'Kyle Field Clean up', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
                      :description => 'Aggie Habitat for Humanity is the Texas A&M Campus Chapter of Habitat for Humanity International. We work closely with Bryan/College Station Habitat for Humanity.',
                      :date => '2017-09-20', :start_time => '09:00:00', :end_time => '13:00:00', :capacity => 1, :max_points => 2.0, 
                      :meeting => false, :contact => 987654321, :image => 'kylefield-jets.jpeg', :publish => false},
                      
                      # events to seed in points for users
                      {:name => 'Yogurt Land Profit Share', :address => '1800 S Texas Ave, College Station, TX 77840',
                      :description => 'Profit share for our organization at Yogurtland',
                      :date => '2017-09-21', :start_time => '09:00:00', :end_time => '13:00:00', :capacity => 10, :max_points => 2.0, 
                      :meeting => false, :contact => 987654321, :image => 'Aggie_Rotaract_nav.png', :publish => true},
                      
                      {:name => 'Rotary Breakfast', :address => '1800 S Texas Ave, College Station, TX 77840',
                      :description => 'Breakfast with community Rotary members, possibility of eating breakfast with someone that used to have career with your degree',
                      :date => '2017-9-22', :start_time => '09:00:00', :end_time => '13:00:00', :capacity => 10, :max_points => 2.0, 
                      :meeting => false, :contact => 987654321, :image => 'Aggie_Rotaract_nav.png', :publish => true},
                      
                      {:name => 'Aggie Replant', :address => '1800 S Texas Ave, College Station, TX 77840',
                      :description => 'Replanting trees in the surrounding area.',
                      :date => '2017-03-20', :start_time => '09:00:00', :end_time => '13:00:00', :capacity => 10, :max_points => 2.0, 
                      :meeting => false, :contact => 987654321, :image => 'Aggie_Rotaract_nav.png', :publish => true}
                      
                    ]
                     
            
            events.each do |event|
                Event.create!(event)
            end
# Iteration 2

meetings = [
          {:name => 'Meeting 1', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
          :description => 'Since its introduction in 1982, The Big Event has become the largest, one-day, student-run service project in the nation. Each spring, tens of thousands of Texas A&M students come together to say "Thank You" to the residents of Bryan and College Station. For the past 33 years, Aggie students have participated in this annual event to show their appreciation to the surrounding community, completing service projects such as yard work, window washing, and painting for residents of the community. Although The Big Event has become the largest one-day, student-run service project in the nation, our message and our mission remains the same – to simply say “Thank You.”',
          :date => '2017-12-01',:start_time => '10:00:00', :end_time => '15:00:00', :capacity => 30, :max_points => 1.0, 
          :meeting => true, :contact => 123456789, :image => '', :publish => true},
           
          {:name => 'Meeting 2', :address => 'Administration Building, 400 Bizzell St, College Station, TX 77843',
          :description => 'Aggie Habitat for Humanity is the Texas A&M Campus Chapter of Habitat for Humanity International. We work closely with Bryan/College Station Habitat for Humanity.',
          :date => '2017-12-02', :start_time => '09:00:00', :end_time => '13:00:00', :capacity => 25, :max_points => 1.0, 
          :meeting => true, :contact => 987654321, :image => '', :publish => true}
         ]
         

meetings.each do |event|
    Event.create!(event)
end

users = [
  {:UIN => 123456789, :name => "Carlos Cardin", :phone => "1234567890", :email => "CarlosCardin@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => true, :active => false
  },
  {:UIN => 987654321, :name => "Brandon Ellis", :phone => "0987654321", :email => "BrandonEllis@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => true, :active => false
  },
  {:UIN => 123456710, :name => "Jared Russell", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456711, :name => "Mary Shirley", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456712, :name => "Sam Simmons", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456713, :name => "Megan Holle", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456714, :name => "Natalie Niel", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456715, :name => "Jon Smith", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456716, :name => "Jill Penny", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456717, :name => "Amanda Cerami", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456718, :name => "Andre Jones", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456719, :name => "Megan Baker", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456721, :name => "Lori Niel", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456722, :name => "Lindy Niel", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456723, :name => "Katy Shirly", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456724, :name => "Russel Shirley", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456725, :name => "Tre Barry", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456726, :name => "Tyler Anker", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456727, :name => "Austin Anker", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456728, :name => "Erin Anker", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456729, :name => "Jeff Russell", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456730, :name => "Nick Jackson", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456731, :name => "Colin Russell", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456732, :name => "Leighton Harrison", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456733, :name => "Joel Harrison", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456734, :name => "Nikki Harrison", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456735, :name => "Parker Harrison", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "male", :officer => false, :active => false
  },
  {:UIN => 123456736, :name => "Bella Russell", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456737, :name => "Aubrey Russell", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456738, :name => "Faith Russell", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456739, :name => "Emma Russell", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  },
  {:UIN => 123456740, :name => "Julie Russell", :phone => "1234567890", :email => "me@tamu.edu", 
    :address => "GSC Agronomy Rd.", :classification => "Freshman", :major => "CSCE", :shirt => "M",
    :gender => "female", :officer => false, :active => false
  }
]


users.each do |user|
    User.create!(user)
end

points = [
  {:event_id => 5, :points => 3, :UIN => 987654321, :issue_date => '2017-01-21'},
  {:event_id => 6, :points => 3.5, :UIN => 123456789, :issue_date => '2017-01-21'},
  {:event_id => 3, :points => 3, :UIN => 987654321, :issue_date => '2017-01-21'},
  {:event_id => 7, :points => 2, :UIN => 123456789, :issue_date => '2017-02-21'},
  {:event_id => 2, :points => 3, :UIN => 987654321, :issue_date => '2017-01-21'},
  {:event_id => 8, :points => 4.5, :UIN => 123456789, :issue_date => '2017-03-21'},
]

points.each do |point|
  Point.create!(point)
end

# testing the past events for approving points
attendances = [
    
    {:UIN => 987654321, :car_ride => 0, :comments => "more fun fun fun", :wait_listed => 0, :event_id => 3, :time_stamp => '2017-03-26 19:37:13', :approved => 0},
    {:UIN => 123456789, :car_ride => 0, :comments => "fun fun fun", :wait_listed => 0, :event_id => 3, :time_stamp => '2017-03-26 08:00:00', :approved => 0},

    
    {:UIN => 987654321, :car_ride => 0, :comments => "fun fun fun", :wait_listed => 0, :event_id => 4, :time_stamp => '2017-03-26 08:00:00', :approved => 0},
    {:UIN => 123456789, :car_ride => 0, :comments => "more fun fun fun", :wait_listed => 0, :event_id => 4, :time_stamp => '2017-03-26 19:50:13', :approved => 0},

    
]

attendances.each do |attendance|
    Attendance.create!(attendance)
end

password = [ :password => '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8']

            password.each do |pwd|
                Admin.create!(pwd)
            end

puts "--- done"