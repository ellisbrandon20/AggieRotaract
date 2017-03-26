Feature: Meeting Signin
  As a member
  So that I can recieve credit for attending meetings
  I want to be able to log in with my UIN and receieve points
  
Scenario: Signing In
  Given I am on the page "points/meeting"
  And User "123456789" is added to database
  And Event "Meeting 1" is added to database
  When UIN "123456789" is inputted
  And I select "Meeting 1" in dropdown
  Then I press "login_button_id"
  Then I am on the page "points_meeting"