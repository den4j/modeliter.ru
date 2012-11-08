# This migration comes from spree_customizers (originally 20121027181249)
class AddAttachmentShopfrontToCustomizer < ActiveRecord::Migration
  def self.up
    add_column :customizers, :shopfront_file_name, :string
    add_column :customizers, :shopfront_content_type, :string
    add_column :customizers, :shopfront_file_size, :integer
    add_column :customizers, :shopfront_updated_at, :datetime
  end

  def self.down
    remove_column :customizers, :shopfront_file_name
    remove_column :customizers, :shopfront_content_type
    remove_column :customizers, :shopfront_file_size
    remove_column :customizers, :shopfront_updated_at
  end
end
