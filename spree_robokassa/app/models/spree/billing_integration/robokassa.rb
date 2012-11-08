module Spree
	class BillingIntegration::Robokassa < BillingIntegration
		def provider_class
			ActiveMerchant::Billing::Integration::Robokassa
		end
	end
end