class ShopTheme < ActiveRecord::Base

	attr_accessible :background, :shopfront, :item_background
	has_attached_file :background
	has_attached_file :shopfront
	has_attached_file :item_background

	has_one :shop

end
