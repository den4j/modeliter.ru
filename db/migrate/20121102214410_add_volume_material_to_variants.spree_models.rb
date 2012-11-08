# This migration comes from spree_models (originally 20121027211813)
class AddVolumeMaterialToVariants < ActiveRecord::Migration
  def change
	  change_table :spree_variants do |t|
		  t.float :volume
		  t.references :material
	  end
  end
end
