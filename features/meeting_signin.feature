Feature: Meeting Signin
  As a member
  So that I can recieve credit for attending meetings
  I want to be able to log in with my UIN and receieve points
  
Scenario: Signing In
  Given I am on the page "points_meeting"
  When UIN "123456789" is inputted
  And I click on 