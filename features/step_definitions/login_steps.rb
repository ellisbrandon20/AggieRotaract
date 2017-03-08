When(/^I type in "([^"]*)"$/) do |arg1|
  # type arg1 in input box
  fill_in 'login_UIN_id', :with => arg1
end