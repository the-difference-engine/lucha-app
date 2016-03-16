class ClientProgram < ActiveRecord::Base
	validates_uniqueness_of :client_id


	belongs_to :client
	belongs_to :programable, polymorphic: true
end
