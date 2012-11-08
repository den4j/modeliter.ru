class CreateCustomizers < ActiveRecord::Migration
	def change
		create_table :customizers do |t|
			t.string :name
			t.text :description
			t.string :url
			t.references :user

			t.timestamps
		end
	end
end
