# This migration comes from spree_customizers (originally 20121027174742)
class AddCustomizationToModels < ActiveRecord::Migration
	def change
		change_table :models do |t|
			t.string :type
			t.text :customization_params
			t.references :customizer
		end
	end
end
