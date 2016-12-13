class SeniorRepair < ActiveRecord::Base
	validates_uniqueness_of :client_id


	belongs_to :client

end
