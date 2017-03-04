Given (/^(?:|I )am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^I press "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_link(arg1)
end

# i am passing the route so "events" grabs the events#index 
# if i wanted the edit event view i would pass "edit_event"
When(/^I visit "([^"]*)"$/) do |arg1|
  visit(arg1)
end

# Then(/^I should see "([^\"]*)"$/) do |text|
#     #page.should have_content(text)
#     #page.find_by_id("event_title").text(text)
# end

#page.find("#some-id")[:class].include?("some-class")


# Then(/^I should not see "([^\"]*)"$/) do |text|
#     response.should_not contain(text)
# end