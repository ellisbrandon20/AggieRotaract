class AddContactToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :UIN, :integer
  end
end
