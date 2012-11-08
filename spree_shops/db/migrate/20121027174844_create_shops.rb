class CreateShops < ActiveRecord::Migration
	def change
		create_table :shops do |t|
			t.string :name
			t.text :description
			t.references :user
			t.references :shop_theme

			t.timestamps
		end
	end
end
