class RemoveEndTimeNameFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :end_time, :datetime
  end
end
