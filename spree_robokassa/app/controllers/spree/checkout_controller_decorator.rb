module Spree
	CheckoutController.class_eval do
		before_filter :redirect_to_robokassa_if_needed

		def redirect_to_robokassa_if_needed
			if ((@order.state == "payment") && @order.valid?)
				payment = @order.payment
				unless payment
					payment = Payment.new
					payment.amount = @order.total
					payment.payment_method = PaymentMethod.find_by_type("Spree::BillingIntegration::Robokassa")
					@order.payments << payment
					payment.started_processing
				end
			end
		end
	end
end