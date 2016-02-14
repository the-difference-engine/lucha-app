class ProgramEmployee < ActiveRecord::Base
	belongs_to :user
	belongs_to :programable, polymorphic: true

end
