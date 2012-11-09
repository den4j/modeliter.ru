Spree::Core::Engine.routes.draw do
	resources :customizers, :path => 'create'
	post "/create/:id" => "customizers#create_customized_model"

	namespace :admin do

		resources :customizers do
			resources :customization_params
		end

	end

	root :to => 'customizers#index'
end
