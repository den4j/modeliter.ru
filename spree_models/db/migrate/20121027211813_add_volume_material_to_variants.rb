class AddVolumeMaterialToVariants < ActiveRecord::Migration
  def change
	  change_table :spree_variants do |t|
		  t.float :volume
		  t.references :material
	  end
  end
end
