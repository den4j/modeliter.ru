module Spree
	module Admin
		class CustomizersController < Spree::Admin::BaseController
			before_filter :load_customizer, :only => [:show, :edit, :update, :destroy]

			respond_to :html

			def index
				@customizers = Customizer.all()
				respond_with(@customizers)
			end

			def show
				respond_with(@customizer)
			end

			def new
				@customizer = Customizer.new
				respond_with(@customizer)
			end

			def create
				@customizer = Customizer.create(params[:customizer])
				redirect_to admin_customizers_path, notice: t('Customizer was successfully created')
			end

			def edit
				respond_with(@customizer)
			end

			def update
				if @customizer.update_attributes(params[:customizer])
					redirect_to admin_customizers_path, notice: t('Customizer was successfully updated')
				else
					render :action => :edit
				end
			end

			def destroy
				@customizer.destroy
				redirect_to admin_customizers_path, notice: t('Customizer was deleted')
			end

			private

			def load_customizer
				@customizer = Customizer.find(params[:id]) if params[:id]
			end

		end
	end
end
