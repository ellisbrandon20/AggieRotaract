class AddStuffToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :description, :text
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
    add_column :events, :max_points, :float
    add_column :events, :contact, :integer
    add_column :events, :image, :string
  end
end
