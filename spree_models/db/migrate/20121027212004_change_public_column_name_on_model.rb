class ChangePublicColumnNameOnModel < ActiveRecord::Migration
  def change
	  rename_column :models, :public?, :is_public
  end
end
