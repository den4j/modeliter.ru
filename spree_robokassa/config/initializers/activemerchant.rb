require 'active_merchant'
require 'active_merchant/billing/integrations/action_view_helper'

ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)

Rails.configuration.robokassa_login = "modeliter"
Rails.configuration.robokassa_secret1 = ""
Rails.configuration.robokassa_secret2 = ""

ActiveMerchant::Billing::Base.integration_mode = :test