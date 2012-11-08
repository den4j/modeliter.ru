# This migration comes from spree_models (originally 20121027212004)
class ChangePublicColumnNameOnModel < ActiveRecord::Migration
  def change
	  rename_column :models, :public?, :is_public
  end
end
