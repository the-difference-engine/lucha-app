class ProgramEmployee < ActiveRecord::Base
	belongs_to :user
	belongs_to :programable, polymorphic: true

	# serialize :user_id, EncryptedCoder.new
	# serialize :programable_id, EncryptedCoder.new
	# serialize :programable_type, EncryptedCoder.new
	

end
