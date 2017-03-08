Feature: Login In
	As a user or admin
	So that I can access the website
	I can type in creditionals to login to the website

Scenario: Login as user
	Given I am on the root page
	When I type in "123456789"
	And I press "login_button_id"
	Then I should be on "dashboard_index"