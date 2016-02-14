class ClientProgram < ActiveRecord::Base
	belongs_to :client
	belongs_to :programable, polymorphic: true
end
