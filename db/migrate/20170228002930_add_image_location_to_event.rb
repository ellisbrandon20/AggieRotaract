class AddImageLocationToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :img_location, :text
  end
end
