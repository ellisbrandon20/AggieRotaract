class AddDescrToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :descr, :text
  end
end
