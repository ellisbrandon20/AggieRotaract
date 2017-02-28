class RemoveStartTimeFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :startTime, :datetime
  end
end
