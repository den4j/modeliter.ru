class CustomizedModel < Model

	attr_accessible :customization_params
	serialize :customization_params

	belongs_to :customizer

end