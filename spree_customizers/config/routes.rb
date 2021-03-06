Spree::Core::Engine.routes.draw do
	resources :customizers, :path => 'create'
	get "/customizers/image_selector/*path" => "customizers#image_selector", :defaults => { :format => 'json' }
	post "/create/:id" => "customizers#create_customized_model"

	namespace :admin do
		resources :customizers do
			resources :customization_params
		end
	end

	root :to => 'customizers#index'
end
