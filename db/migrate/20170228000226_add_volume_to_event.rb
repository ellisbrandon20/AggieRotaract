class AddVolumeToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :volume_cap, :integer
  end
end
