class AddAttachmentBackgroundShopfrontItemBackgroundToShopTheme < ActiveRecord::Migration
  def self.up
    add_column :shop_themes, :background_file_name, :string
    add_column :shop_themes, :background_content_type, :string
    add_column :shop_themes, :background_file_size, :integer
    add_column :shop_themes, :background_updated_at, :datetime
    add_column :shop_themes, :shopfront_file_name, :string
    add_column :shop_themes, :shopfront_content_type, :string
    add_column :shop_themes, :shopfront_file_size, :integer
    add_column :shop_themes, :shopfront_updated_at, :datetime
    add_column :shop_themes, :item_background_file_name, :string
    add_column :shop_themes, :item_background_content_type, :string
    add_column :shop_themes, :item_background_file_size, :integer
    add_column :shop_themes, :item_background_updated_at, :datetime
  end

  def self.down
    remove_column :shop_themes, :background_file_name
    remove_column :shop_themes, :background_content_type
    remove_column :shop_themes, :background_file_size
    remove_column :shop_themes, :background_updated_at
    remove_column :shop_themes, :shopfront_file_name
    remove_column :shop_themes, :shopfront_content_type
    remove_column :shop_themes, :shopfront_file_size
    remove_column :shop_themes, :shopfront_updated_at
    remove_column :shop_themes, :item_background_file_name
    remove_column :shop_themes, :item_background_content_type
    remove_column :shop_themes, :item_background_file_size
    remove_column :shop_themes, :item_background_updated_at
  end
end
