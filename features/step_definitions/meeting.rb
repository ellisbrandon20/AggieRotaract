When(/^UIN "([^"]*)" is inputted$/) do |arg1|
  fill_in 'uin_input', :with => arg1  #UIN input
end

Given(/^User "([^"]*)" is added to database/) do |arg1|
  User.create!(:name => "test", :UIN => arg1)
end

Given(/^Event "([^"]*)" is added to database$/) do |arg1|
  Event.create!(:name => arg1)
end

When(/^I select "([^"]*)" in dropdown$/) do |arg1|
#   find('#meeting_id').find(:xpath, 'option[1]').select_option
#   locate("//*[@id='meeting_id'").find(:xpath, 'option[1]').select_option
# find(:xpath, '//option[contains(text(), "Meeting 1")]').select_option
# select "Meeting 1", :from => "meeting_id"
page.has_xpath?("//div[@id='meeting_id']")
# page.has_xpath?("//div[@id='meeting-option']")
# page.find(:xpath, "//div[@id='meeting-option']").click
page.find('meeting-option', :text => 'Meeting 1')
end