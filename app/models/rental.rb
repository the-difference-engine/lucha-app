class Rental < ActiveRecord::Base
  validates_uniqueness_of :client_id
	validates_presence_of :client

  validates :wheelchair_accessible, :inclusion => {:in => [true, false]}
  validates :car_owner, :inclusion => {:in => [true, false]}
  validates :pet_owner, :inclusion => {:in => [true, false]}
  validates :agree_to_fee, :inclusion => {:in => [true, false]}
  validates :employer_phone, length: {minimum: 10}

  validates :hear_of_property, :reason_for_move, :housing_situation, :employer_name, :employer_address, :employer_city, presence: true

	belongs_to :client

  # serialize :evictions, EncryptedCoder.new
  # serialize :client_id, EncryptedCoder.new
  # serialize :waitlist_num, EncryptedCoder.new
  # serialize :studio, EncryptedCoder.new
  # serialize :two_bed, EncryptedCoder.new
  # serialize :three_bed, EncryptedCoder.new
  # serialize :wheelchair_accessible, EncryptedCoder.new
  # serialize :car_owner, EncryptedCoder.new
  # serialize :pet_owner, EncryptedCoder.new
  serialize :kind_of_pet, EncryptedCoder.new
  serialize :hear_of_property, EncryptedCoder.new
  serialize :reason_for_application, EncryptedCoder.new
  serialize :landlord_name, EncryptedCoder.new
  serialize :landlord_address, EncryptedCoder.new
  serialize :landlord_phone, EncryptedCoder.new
  serialize :occupancy_at_apartment, EncryptedCoder.new
  # serialize :monthly_rent, EncryptedCoder.new
  # serialize :fuel_electric, EncryptedCoder.new
  serialize :pre_landlord_name, EncryptedCoder.new
  serialize :pre_landlord_address, EncryptedCoder.new
  serialize :pre_landlord_phone EncryptedCoder.new
  # serialize :pre_rent, EncryptedCoder.new
  # serialize :pre_fuel_electric, EncryptedCoder.new
  serialize :reason_for_move, EncryptedCoder.new
  serialize :housing_situation, EncryptedCoder.new
  serialize :employer_name, EncryptedCoder.new
  serialize :employer_address, EncryptedCoder.new
  serialize :employer_city, EncryptedCoder.new
  serialize :employer_state, EncryptedCoder.new
  serialize :employer_phone, EncryptedCoder.new
  serialize :position, EncryptedCoder.new
  # serialize :length_employed, EncryptedCoder.new
  serialize :personal_reference_name, EncryptedCoder.new
  serialize :per_ref_address, EncryptedCoder.new
  serialize :per_ref_street, EncryptedCoder.new
  serialize :per_ref_state, EncryptedCoder.new
  serialize :per_ref_phone, EncryptedCoder.new
  serialize :per_ref_relationship, EncryptedCoder.new
  serialize :displaced, EncryptedCoder.new
  serialize :homeless, EncryptedCoder.new
  # serialize :over_fifty_percent, EncryptedCoder.new
  # serialize :agree_to_fee, EncryptedCoder.new



  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |rental|
        csv << rental.attributes.values_at(*column_names)
      end
    end
  end

  def pretty_time
    created_at.strftime("%A, %b %d")
  end
end
