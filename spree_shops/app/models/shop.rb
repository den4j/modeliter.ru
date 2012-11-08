class Shop < ActiveRecord::Base
  attr_accessible :name, :description
	belongs_to :owner, :class_name => Spree::User
	belongs_to :theme, :class_name => ShopTheme

end
