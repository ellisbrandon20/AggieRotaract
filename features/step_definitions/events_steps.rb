Given(/^I have events titled (.+)$/) do |events|
    events.split(", ").each do |event|
        Event.create!(:name => event)
    end
end

Then(/^I should see events$/) do
  page.has_xpath?("//div[@id='event-card']")
end