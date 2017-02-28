class RemoveEndTimeFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :endTime, :datetime
  end
end
