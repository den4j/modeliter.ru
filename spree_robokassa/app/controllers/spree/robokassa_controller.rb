module Spree
	class RobokassaController < ApplicationController
		include ActiveMerchant::Billing::Integrations

		skip_before_filter :verify_authenticity_token # skip before filter if you chosen POST request for callbacks

		before_filter :create_notification
		before_filter :find_order

		# Robokassa call this action after transaction
		def paid
			#@notification = Robokassa::Notification.new(request.query_string,
			#                                            :secret => Rails.configuration.robokassa_secret2)
			if @notification.acknowledge # check if it’s genuine Robokassa request
				enter_payment
				render :text => @notification.success_response
			else
				head :bad_request
			end
		end

		# Robokassa redirect user to this action if it’s all ok
		def success
			if !(@order.state == 'complete') && @notification.acknowledge
				enter_payment
			end
			redirect_to @order, :notice => I18n.t("notice/robokassa/success")
		end
		# Robokassa redirect user to this action if it’s not
		def fail
			redirect_to "/cart", :notice => I18n.t("notice/robokassa/fail")
		end

		private

		def enter_payment
			payment = @order.payments.where(:state => 'processing', :amount => @notification.amount)
			if payment.empty?
				payment = Spree::Payment.new
				payment.amount = @notification.amount
				payment.payment_method = Spree::PaymentMethod.find_by_type("Spree::BillingIntegration::Robokassa")
				@order.payments << payment
				payment.started_processing
			else
				payment = payment.first
			end
			payment.complete
			#payment.complete
			#@order.next!
			#@order.update_totals

			@order.finalize!
			#@order.save
			#@order.finalize!

			#until @order.state == "complete"
			#	puts @order.inspect
			#	if @order.next!
			#		@order.update!
			#		state_callback(:after)
			#	end
			#end
		end

		def create_notification
			secret = params[:action] == "paid" ? Rails.configuration.robokassa_secret2 : Rails.configuration.robokassa_secret1
			@notification = Robokassa::Notification.new(request.query_string, :secret => secret)
		end

		def find_order
			@order = Spree::Order.find(@notification.item_id)
		end
	end
end