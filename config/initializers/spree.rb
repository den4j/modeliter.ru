# Configure Spree Preferences
# 
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do: 
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
	config.default_country_id = 168
	config.checkout_zone = "SNG"
	config.default_locale = "ru"
	config.currency = "rur"
	config.display_currency = false
end

Spree::Auth::Config[:registration_step] = false
Spree.user_class = "Spree::User"


json = File.read("config/rur_currency.json")
json.force_encoding(::Encoding::UTF_8) if defined?(::Encoding)
rur_currency = JSON.parse(json, :symbolize_names => true)
Money::Currency.register(rur_currency);

Spree::Config.set(:allow_ssl_in_production => false)

#symbol = CGI::unescape_html("&#x0440;&#x0443;&#x0431;")
#curr = {
#		:priority => 100,
#		:iso_code => "RUR",
#		:name => "Russian Ruble",
#		:symbol => symbol,
#		:subunit => "kop",
#		:subunit_to_unit => 100,
#		:symbol_first => false,
#		:decimal_mark => ",",
#		:thousands_separator => " ",
#		:no_cents_if_whole => true
#}

