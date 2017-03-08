Given(/^I have events titled (.+)$/) do |events|
    events.split(", ").each do |event|
        Event.create!(:name => event)
    end
end

Then(/^I should see events$/) do
  page.has_xpath?("//div[@id='event-card']")
end

Then(/^I should see "([^"]*)"$/) do |arg1|
    # I cant figure out how to grab the event_title tag and the value of it to check this
    # puts("--------------")
    # page.find(:xpath, "//div[@id='event_title']")
    # puts("--------------")
    # find_by_id("event_title").native.text == arg1
    
end

Given(/^I have events titled (.+)$/) do |events|
    events.split(", ").each do |event|
        Event.create!(:name => event)
    end
end

Then(/^I should see events$/) do
  page.has_xpath?("//div[@id='event-card']")
end

When(/^event information is inputted$/) do
  fill_in 'name_id', :with => 'Event'  #event name
  fill_in 'description_id', :with => 'Descr for test event'
  fill_in 'address_id', :with => '123 Event Address'
  fill_in 'date_id', :with => '03/01/2017'
  fill_in 'start_time_id', :with => '3:00'
  fill_in 'end_time_id', :with => '4:00'
  fill_in 'max_points_id', :with => '4'
  fill_in 'capacity_id', :with => '4'
  fill_in 'contact_id', :with => '123456789'
end