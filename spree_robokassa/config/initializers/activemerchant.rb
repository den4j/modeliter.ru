require 'active_merchant'
require 'active_merchant/billing/integrations/action_view_helper'

ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)

Rails.configuration.robokassa_login = "modeliter"
Rails.configuration.robokassa_secret = "cwHEkkj0phYcYu5oQf9e"

ActiveMerchant::Billing::Base.integration_mode = :test