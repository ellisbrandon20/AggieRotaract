Feature: View My Events
	As a user
	So that I can access the website
	I can type in creditionals to login to the website

Scenario: My Events List
  Given I am going to events
  When I visit "attendances"
  Then I should see events