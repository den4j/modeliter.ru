# This migration comes from spree_models (originally 20121027174907)
class CreateMaterials < ActiveRecord::Migration
	def change
		create_table :materials do |t|
			t.string :name
			t.text :description
			t.float :volume_price

			t.timestamps
		end
	end
end
