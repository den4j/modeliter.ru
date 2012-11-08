class CreatePreviews < ActiveRecord::Migration
  def change
    create_table :previews do |t|
      t.integer :type
      t.text :comment
      t.references :model

      t.timestamps
    end
  end
end
