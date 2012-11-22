class Spree::CustomizersController < Spree::BaseController

	def index
		@customizers = Customizer.all
		@top_customizer = Customizer.find_by_name("candle")
		render 'index'
	end

	def show
		@customizer = Customizer.find(params[:id])
		template_path = get_show_template_path(@customizer)
		if lookup_context.find_all(template_path).any?
			render template_path and return
		else
			render 'show'
		end
		#render :nothing => true
	end

	def image_selector
		path = params[:path]
		data = {}
		search_string = "**/#{["spree_customizers", "app", "assets", path.split("/").select{|path| !path.empty? }].join("/**/")}/*"

		Dir.glob(search_string).sort_by{|file| file}.each_with_index do |file, i|
			asset_file = ActionController::Base.helpers.asset_path(file.split("/app/assets/images/")[1])
			basename = File.basename(file)
			if i == 0 then
				data['default'] = basename
			end
			data[basename] = asset_file
		end
		respond_to do |format|
			format.json { render :json => data}
		end
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

