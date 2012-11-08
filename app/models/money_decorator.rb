Spree::Money.class_eval do
	def to_s
		@options.merge!({:no_cents_if_whole => true, :symbol => true})
		@money.format @options
	end
end