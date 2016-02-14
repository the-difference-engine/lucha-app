class LawProject < ActiveRecord::Base
	has_many :program_employees, as: :programable
	belongs_to :client

end
