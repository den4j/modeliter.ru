module Spree
	module Admin
		class CustomizationParamsController < Spree::Admin::BaseController
			before_filter :load_customizer
			before_filter :load_customization_param, :only => [:show, :edit, :update, :destroy]

			respond_to :html

			def index
				@customization_params = CustomizationParam.where(:customizer_id => @customizer.id)
				respond_with(@customization_params)
			end

			def show
				respond_with(@customization_param)
			end

			def new
				@customization_param = CustomizationParam.new
				respond_with(@customization_param)
			end

			def create
				@customization_param = CustomizationParam.create(params[:customization_param])
				redirect_to admin_customizer_customization_params_path(@customizer), notice: t('Customization Param was successfully created')
			end

			def edit
				respond_with(@customization_param)
			end

			def update
				if @customization_param.update_attributes(params[:customization_param])
					redirect_to admin_customizer_customization_params_path(@customizer), notice: t('Customization Param was successfully updated')
				else
					render :action => :edit
				end
			end

			def destroy
				@customization_param.destroy
				redirect_to admin_customizer_customization_params_path(@customizer), notice: t('Customization Param was deleted')
			end

			private

			def load_customizer
				@customizer = Customizer.find(params[:customizer_id]) if params[:customizer_id]
			end

			def load_customization_param
				@customization_param = CustomizationParam.find(params[:id]) if params[:id]
			end

		end
	end
end
