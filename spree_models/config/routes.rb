Spree::Core::Engine.routes.draw do
	match "/products" => redirect("/")
end
