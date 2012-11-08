# This migration comes from spree_customizers (originally 20121103000403)
class CreateCustomizationParams < ActiveRecord::Migration
  def change
    create_table :customization_params do |t|
			t.string :name
			t.text :title
			t.text :hint
			t.string :type
			t.text :default_value
			t.integer :order
			t.references :customizer

      t.timestamps
    end
  end
end
