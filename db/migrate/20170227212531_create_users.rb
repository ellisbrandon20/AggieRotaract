class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.integer :UIN
    	t.string :name
    	t.string :phone
    	t.string :email
    	t.text :address
    	t.string :classification
    	t.string :major
    	t.string :shirt
    	t.string :gender
    	t.boolean :officer
    	t.boolean :active
    	
    	t.timestamps
    end
  end
end
