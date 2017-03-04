Feature: View Events
  As a member or admin
  So that I can see volunteer possibilites
  I want to view upcoming events
  
Scenario: Events List
  Given I have events titled Big Event, Habitat for Humanity
  When I visit "events"
  Then I should see events
  
Scenario: Events List
  Given I have events titled Big Event, Habitat for Humanity
  When I visit "events"
  Then I should see "Big Event"
  And I should see "Habitat for Humanity"