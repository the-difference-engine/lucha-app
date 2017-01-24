# == Schema Information
#
# Table name: homebuyings
#
#  id                         :integer          not null, primary key
#  lender                     :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  client_id                  :integer
#  hear_of_workshop           :string
#  contact_for_appointment    :boolean          default(FALSE)
#  real_estate_contract       :boolean          default(FALSE)
#  realtor_name               :string
#  realtor_phone              :string
#  property_address           :string
#  property_state             :string
#  property_city              :string
#  loan_officer_name          :string
#  loan_officer_email         :string
#  loan_officer_phone         :string
#  payment_assistance_program :string
#  approx_closing_date        :string
#

class Homebuying < ActiveRecord::Base
	validates_uniqueness_of :client_id
	validates_presence_of :client


  validates :lender, :realtor_name, :property_address, :property_city, :loan_officer_name, :loan_officer_email, :loan_officer_phone, presence: true
  validates :contact_for_appointment, :inclusion => {:in => [true, false]}
  validates :real_estate_contract, :inclusion => {:in => [true, false]}
  validates_date :approx_closing_date, :on_or_after => lambda { Date.current }

  validates_format_of :realtor_phone,
    :with => /[0-9]{3}-[0-9]{3}-[0-9]{4}/,
    :message => "- Phone numbers must be in xxx-xxx-xxxx format."

  validates_format_of :loan_officer_phone,
    :with => /[0-9]{3}-[0-9]{3}-[0-9]{4}/,
    :message => "- Phone numbers must be in xxx-xxx-xxxx format."

  validates_format_of :loan_officer_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	has_many :program_employees, as: :programable
	belongs_to :client

end
