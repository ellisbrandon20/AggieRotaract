class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :address
      t.text :description
      t.time :start_time
      t.time :end_time
      t.string :capacity
      t.string :integer
      t.decimal :max_points
      t.boolean :meeting
      t.integer :contact
      t.string :image

      t.timestamps
    end
  end
end
