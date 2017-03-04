class RemoveStuffFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :descr, :text
    remove_column :events, :volume_cap, :integer
    remove_column :events, :max_pts, :float
    remove_column :events, :img_location, :text
  end
end
