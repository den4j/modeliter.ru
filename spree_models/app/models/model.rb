class Model < ActiveRecord::Base
  attr_accessible :model_file, :description, :name, :is_public
	has_attached_file :model_file
	belongs_to :author, :class_name => Spree::User
	has_many :previews
end
