class Homebuying < ActiveRecord::Base
	validates_uniqueness_of :client_id
	validates_presence_of :client

  validates :lender, :realtor_name, :realtor_phone, :property_address, :property_city, :loan_officer_name, :loan_officer_email, :loan_officer_phone, presence: true

  validates :contact_for_appointment, :inclusion => {:in => [true, false]}
  validates :real_estate_contract, :inclusion => {:in => [true, false]}
  validates :approx_closing_date, :on_or_before => lambda { Date.current }

  validates_format_of :realtor_phone, :with => ^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-‌​9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})$

  validates_format_of :loan_officer_phone, :with => ^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-‌​9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})$

  validates_format_of :loan_officer_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create


	has_many :program_employees, as: :programable
	belongs_to :client

end
