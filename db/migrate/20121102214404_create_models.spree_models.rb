# This migration comes from spree_models (originally 20121027171246)
class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.text :description
      t.boolean :public?
      t.references :author

      t.timestamps
    end
  end
end
