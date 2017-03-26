Given(/^I have events titled (.+)$/) do |events|
    
end

Then(/^I should see "([^\"]*)"$/) do |text|
     #page.should have_content(text)
     #page.find_by_id("event_title").text(text)
 end
 
 When(/^I visit "([^"]*)"$/) do |arg1|
  visit(arg1)
end