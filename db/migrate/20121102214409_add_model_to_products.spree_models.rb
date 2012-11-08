# This migration comes from spree_models (originally 20121027211311)
class AddModelToProducts < ActiveRecord::Migration
  def change
	  change_table :spree_products do |t|
			t.references :model
			t.decimal :model_price, :precision => 8, :scale => 2, :null => false
		  t.boolean :is_printable
		  t.references :shop
	  end
  end
end
