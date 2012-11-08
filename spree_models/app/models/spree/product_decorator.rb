module Spree
	Product.class_eval do
		attr_accessible :model_price, :is_printable

		belongs_to :model
		belongs_to :shop
		has_and_belongs_to_many :materials, :join_table => 'materials_products'

		before_save :set_model_price

		private
			def set_model_price
				if !(model_price.present?)
					self.model_price = 0
				end
			end
	end
end