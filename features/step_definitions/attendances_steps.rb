Given(/^I have events titled (.+)$/) do |events|
    
end

Given(/^I have events titled (.+)$/) do |events|
    
end

Given(/^I log in/) do
     visit("/")
     fill_in 'login_UIN_id', :with => "123456789"
     click_button("login_button_id")
end

Then(/^I am going to events/) do
     #page.should have_content(text)
     #page.find_by_id("event_title").text(text)
 end
 