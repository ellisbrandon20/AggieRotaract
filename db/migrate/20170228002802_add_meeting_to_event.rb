class AddMeetingToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :meeting, :boolean
  end
end
