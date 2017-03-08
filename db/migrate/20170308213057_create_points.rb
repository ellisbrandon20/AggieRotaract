class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.integer :event_id
      t.float :points
      t.integer :UIN
      t.datetime :issue_date

      t.timestamps
    end
  end
end
