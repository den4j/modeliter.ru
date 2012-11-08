class AddAttachmentModelFileToModel < ActiveRecord::Migration
  def self.up
    add_column :models, :model_file_file_name, :string
    add_column :models, :model_file_content_type, :string
    add_column :models, :model_file_file_size, :integer
    add_column :models, :model_file_updated_at, :datetime
  end

  def self.down
    remove_column :models, :model_file_file_name
    remove_column :models, :model_file_content_type
    remove_column :models, :model_file_file_size
    remove_column :models, :model_file_updated_at
  end
end
