class AddTitlesToCustomizer < ActiveRecord::Migration
  def change
    add_column :customizers, :title, :text
    add_column :customizers, :subtitle, :text
  end
end
