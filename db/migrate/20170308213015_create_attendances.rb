class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.integer :UIN
      t.boolean :car_ride
      t.text :comments
      t.boolean :wait_listed
      t.integer :event_id
      t.datetime :time_stamp
      t.boolean :approved
      t.string :pref_contact
      t.timestamps
    end
  end
end
