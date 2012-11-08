class CreateShopThemes < ActiveRecord::Migration
	def change
		create_table :shop_themes do |t|

			t.timestamps
		end
	end
end
