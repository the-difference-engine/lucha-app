class Rental < ActiveRecord::Base
	validates_uniqueness_of :client_id
	validates_presence_of :client

  validates :studio, :inclusion => {:in => [true, false]}
  validates :two_bed, :inclusion => {:in => [true, false]}
  validates :three_bed, :inclusion => {:in => [true, false]}
  validates :wheelchair_accessible, :inclusion => {:in => [true, false]}
  validates :car_owner, :inclusion => {:in => [true, false]}
  validates :pet_owner, :inclusion => {:in => [true, false]}
  validates :agree_to_fee, :inclusion => {:in => [true, false]}

  validates :hear_of_property, :reason_for_move, :housing_situation, :employer_name, :employer_address, employer_city, presence: true





	has_many :program_employees, as: :programable
	belongs_to :client

end
