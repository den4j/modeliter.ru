Spree::Core::Engine.routes.draw do
	scope 'robokassa' do
		match 'paid'    => 'robokassa#paid',    :as => :robokassa_paid, :via => [:get, :post]
		match 'success' => 'robokassa#success', :as => :robokassa_success, :via => [:get, :post]
		match 'fail'    => 'robokassa#fail',    :as => :robokassa_fail, :via => [:get, :post]
	end
end
