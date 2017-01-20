# == Schema Information
#
# Table name: senior_repairs
#
#  id         :integer          not null, primary key
#  contractor :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  client_id  :integer
#

class SeniorRepair < ActiveRecord::Base
	validates_uniqueness_of :client_id


	has_many :program_employees, as: :programable
	belongs_to :client

end
