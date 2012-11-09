class Spree::CustomizersController < Spree::BaseController

	respond_to :html

	def index
		@customizers = Customizer.all
		render 'index'
	end

	def show
		@customizer = Customizer.find(params[:id])
		if lookup_context.find_all(get_show_template_path(@customizer)).any?
			render get_show_template_path(@customizer) and return
		else
			render 'show'
		end
		#render :nothing => true
	end

	def create_customized_model
		@model = CustomizedModel.new
		@model.customizer = Customizer.find(params.delete(:id))
		param_names = @model.customizer.customization_params.map {|param| param.name}
		@model.customization_params = params.select {|name, value|
			param_names.include?(name)
		}
		@model.is_public = false
		if signed_in?
			@model.author = current_user
		end
		@model.save

		product = Spree::Product.new
		product.name = @model.customizer.title
		product.permalink = @model.customizer.name
		product.model = @model
		product.model_price = @model.customizer.price
		product.price = product.model_price
		product.save

		@order = current_order(true)
		@order.add_variant(product.master, 1)

		redirect_to "/checkout"
	end

	def get_show_template_path(customizer)
		'customizers/show_' + customizer.name
	end
end

