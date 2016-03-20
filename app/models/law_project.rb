class LawProject < ActiveRecord::Base
	validates_uniqueness_of :client_id
	validates_presence_of :client
	

	has_many :program_employees, as: :programable
	belongs_to :client

end
