Spree::Core::Engine.routes.draw do
	scope 'robokassa' do
		match 'paid'    => 'robokassa#paid',    :as => :robokassa_paid # to handle Robokassa push request
		match 'success' => 'robokassa#success', :as => :robokassa_success # to handle Robokassa success redirect
		match 'fail'    => 'robokassa#fail',    :as => :robokassa_fail # to handle Robokassa fail redirect
	end
end
