Feature: Create Event
  As an admin
  So that I can see volunteer possibilites
  I want to view upcoming events
  
Scenario: Create Event
  Given I am on the page "events/new"
  When event information is inputted
  Then I press "Save Event"