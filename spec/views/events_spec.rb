require 'rails_helper'

RSpec.describe Event, :type => :model do
  it "is valid with valid attributes"
  it "is not valid without a name"
  it "is not valid without a address"
  it "is not valid without a date"
  it "is not valid without a description"
  it "is not valid without a start_time"
  it "is not valid without a end_time"
  it "is not valid without a capacity"
  it "is not valid without a max_points"
  it "is not valid without a meeting"
  it "is not valid without a contact"
  it "is not valid without a image"
end

RSpec.describe Event, :type => :model do
  it "is not valid without a name" do
    event = Event.new(name: nil)
    expect(event).to_not be_valid
end

# RSpec.describe "events/index", :type => :view do
#   it "displays the event information" do
#     assign(:event, Event.new(:name => "Big Event"))
#     render
#     expect(rendered).to include("Big Event")
#   end
# end