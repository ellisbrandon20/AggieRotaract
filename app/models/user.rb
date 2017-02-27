class CreateUsers < ActiveRecord::Migration
	module Classification
		1 = "Freshman"
		2 = "Sophomore"
		3 = "Junior"
		4 = "Senior"
		5 = "GradStudent"
	end

	module Shirt
		1 = "XS"
		2 = "S"
		3 = "M"
		4 = "L"
		5 = "XL"
		6 = "XXL"
		7 = "XXXL"
	end

	def change
    create_table :users do |t|
    	t.integer :UIN
    	t.string :name
    	t.integer :phone
    	t.string :email
    	t.text :address
    	t.Classification :classification
    	t.string :major
    	t.Shirt :shirt
    	t.boolean :gender
    	t.boolean :officer
    	t.boolean :active
    end
end
