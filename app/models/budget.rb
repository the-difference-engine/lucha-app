class Budget < ActiveRecord::Base
  validates_uniqueness_of :client_id
  validates_presence_of :client
  

	belongs_to :client


  def column_count
    Budget.columns.size - 3
  end

	def filled_columns
    filled_count = 0
    attributes.each do |k, v|
      if v != nil
        filled_count+=1
      end
    end
    filled_count - 3
    # Subtracting 3 from the filled_count variable to account for the columns id, updated at, and created at, which were filled automatically and not by the client.
  end




end
