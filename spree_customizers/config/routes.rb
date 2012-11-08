Spree::Core::Engine.routes.draw do
	resources :customizers, :path => 'create'
	post "/create/:id" => "customizers#create_customized_model"

	root :to => 'customizers#index'
end
