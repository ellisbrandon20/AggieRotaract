Feature: View My Events
	As a user
	So that I can view my events
	I can type in creditionals to login to the website and view my events

Scenario: View Event Dashboard
    Given I am on the root page
    When I type in "123456789"
    And I press "login_button_id"
    Then I should be on "attendances"