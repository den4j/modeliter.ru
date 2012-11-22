module Spree
	module CustomizersHelper
		def get_form_partial(customizer)
			partial_path = get_form_partial_path(customizer)
			puts lookup_context.inspect
			lookup_context.exists?(partial_path, ["spree/customizers"], true) ? partial_path : "show_form"
		end

		private
			def get_form_partial_path(customizer)
				"show_form_" + customizer.name
			end
	end
end

