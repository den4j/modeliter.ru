class AddPriceToCustomizers < ActiveRecord::Migration
  def change
    add_column :customizers, :price, :float
  end
end
