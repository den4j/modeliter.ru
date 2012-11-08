class Customizer < ActiveRecord::Base

  attr_accessible :description, :name, :url, :shopfront, :title, :subtitle, :price

	belongs_to :owner, :class_name => Spree::User
  has_many :customized_models
  has_many :customization_params

  has_attached_file :shopfront,
    :styles => {
		    :thumb => "48x48",
		    :cart => "100x100",
		    :customizers_list => "285x250",
        :customizer_full => "450x450" },
    :convert_options => {
        :customizers_list => "-strip",
        :customizer_full => "-strip"}

end