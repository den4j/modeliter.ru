module Spree
	module Admin
		module CustomizationParamsHelper
			def path_to (customizer, customization_param, action)
				p = "/admin/customizers/#{customizer.id}/customization_params"
				unless action == :all
					p << "/#{customization_param.id}"
					if action
						p << "/#{action.to_s}"
					end
				end
				p
			end
		end
	end
end


