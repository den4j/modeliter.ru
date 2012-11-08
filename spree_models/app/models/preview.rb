class Preview < ActiveRecord::Base
	set_inheritance_column :ruby_type

	TYPES = [:image, :video, :model_file]

  attr_accessible :comment, :type, :file

	belongs_to :model
end
