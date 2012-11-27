module Spree
	Address.class_eval do
		unrequired_params = [:zipcode, :state]

		_validators.reject!{ |key, value| unrequired_params.include?(key) }
		_validate_callbacks.each do |callback|
			if callback.raw_filter.respond_to?(:attributes)
				callback.raw_filter.attributes.reject! { |key| unrequired_params.include?(key) }
			end
		end
	end
end