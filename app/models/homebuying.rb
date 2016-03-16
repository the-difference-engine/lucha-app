class Homebuying < ActiveRecord::Base
	validates_uniqueness_of :client_id


	has_many :program_employees, as: :programable
	belongs_to :client

end
