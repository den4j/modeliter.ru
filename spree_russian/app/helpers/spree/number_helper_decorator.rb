ActionView::Helpers::NumberHelper.module_eval do
	def number_to_currency(number, options = {})
		rub = number.to_i
		kop = ((number - rub)*100).round.to_i
		"#{rub}&nbsp;#{RUSSIAN_CONFIG['country']['currency']}".mb_chars
	end
end
