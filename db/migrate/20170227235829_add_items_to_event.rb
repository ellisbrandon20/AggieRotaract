class AddItemsToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :startTime, :datetime
    add_column :events, :endTime, :datetime
  end
end
