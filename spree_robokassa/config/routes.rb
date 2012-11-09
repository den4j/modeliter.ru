Spree::Core::Engine.routes.draw do
	scope 'robokassa' do
		post 'paid'    => 'robokassa#paid',    :as => :robokassa_paid # to handle Robokassa push request
		post 'success' => 'robokassa#success', :as => :robokassa_success # to handle Robokassa success redirect
		post 'fail'    => 'robokassa#fail',    :as => :robokassa_fail # to handle Robokassa fail redirect
	end
end
