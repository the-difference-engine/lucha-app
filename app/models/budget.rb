class Budget < ActiveRecord::Base
  validates_uniqueness_of :client_id
  validates_presence_of :client
  
	belongs_to :client

end
