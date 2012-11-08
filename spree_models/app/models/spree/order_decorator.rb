module Spree
	Order.class_eval do

		checkout_flow do
			go_to_state :address
			#go_to_state :delivery
			go_to_state :payment
			go_to_state :complete
			#remove_transition :from => :address, :to => :complete
		end

		def remember_order_in_session
			session[:my_orders] ||= ""
			ids = "[#{id}]"
			if (!session[:my_orders].include?(ids))
				session[:my_orders] << ids
			end
		end
	end
end

class OrderValidator < ActiveModel::Validator
	def validate(record)
		record.errors.messages.delete(:zipcode)
	end
end

Spree::Address.class_eval do
	include ActiveModel::Validations
	validates_with OrderValidator
end