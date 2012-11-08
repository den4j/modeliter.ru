Spree::Variant.class_eval do
	attr_accessible :volume, :material
	def print_price
		self.volume * self.material.volume_price + self.product.model_price
	end
end