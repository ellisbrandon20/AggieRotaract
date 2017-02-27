class CreateUsers < ActiveRecord::Migration
	def change
    create_table :users do |t|
    	t.integer :UIN
    	t.string :name
    	t.integer :phone
    	t.string :email
    	t.text :address
    	t.string :classification
    	t.string :major
    	t.string :shirt
    	t.boolean :gender
    	t.boolean :officer
    	t.boolean :active
    end
end
