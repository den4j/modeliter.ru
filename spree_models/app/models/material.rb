class Material < ActiveRecord::Base
  attr_accessible :description, :name, :volume_price
	has_many :print_products
	has_many :preview_models, :class_name => 'Model'
	has_many :previews, :class_name => 'Preview', :through => :preview_models
end
