class CustomizationParam < ActiveRecord::Base
	set_inheritance_column :ruby_type
  attr_accessible :name, :title, :hint, :order, :type, :default_value, :customizer_id
	belongs_to :customizer
end
