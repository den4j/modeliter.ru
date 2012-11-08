# This migration comes from spree_customizers (originally 20121105211746)
class AddPriceToCustomizers < ActiveRecord::Migration
  def change
    add_column :customizers, :price, :float
  end
end
