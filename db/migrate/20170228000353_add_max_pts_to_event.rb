class AddMaxPtsToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :max_pts, :float
  end
end
