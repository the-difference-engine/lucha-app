class Homebuying < ActiveRecord::Base
  include Prettytime

	validates_uniqueness_of :client_id
	validates_presence_of :client


  validates :lender, :realtor_name, :property_address, :property_city, :loan_officer_name, :loan_officer_email, :loan_officer_phone, presence: true
  validates :contact_for_appointment, :inclusion => {:in => [true, false]}
  validates :real_estate_contract, :inclusion => {:in => [true, false]}
  validates_date :approx_closing_date, :on_or_after => lambda { Date.current }

  validates_format_of :loan_officer_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	belongs_to :client
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |homebuying|
        csv << homebuying.attributes.values_at(*column_names)
      end
    end
  end
end
