class AddCustomizationToModels < ActiveRecord::Migration
	def change
		change_table :models do |t|
			t.string :type
			t.text :customization_params
			t.references :customizer
		end
	end
end
