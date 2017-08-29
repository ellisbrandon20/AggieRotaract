class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :address
      t.date :date
      t.text :description
      t.time :start_time
      t.time :end_time
      t.integer :capacity
      t.float :max_points
      t.boolean :meeting
      t.string :contact
      t.string :image
      t.boolean :publish

      t.timestamps
    end
  end
end
