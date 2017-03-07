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