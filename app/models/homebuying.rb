class Homebuying < ActiveRecord::Base
	validates_uniqueness_of :client_id
	validates_presence_of :client


  validates :lender, :realtor_name, :realtor_phone, :property_address, :property_city, :loan_officer_name, :loan_officer_email, :loan_officer_phone, presence: true

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
	belongs_to :client,    

end




lender: params[:lender], 
            hear_of_workshop: params[:hear_of_workshop],
            contact_for_appointment: params[:contact_for_appointment],
            real_estate_contract: params[:real_estate_contract],
            realtor_name: params[:realtor_name],
            realtor_phone: params[:realtor_phone],
            property_address: params[:property_address],
            property_state: params[:property_state],
            property_city: params[:property_city],
            loan_officer_name: params[:loan_officer_name],
            loan_officer_email: params[:loan_officer_email],
            loan_officer_phone: params[:loan_officer_phone],
            payment_assistance_program: params[:payment_assistance_program],
            approx_closing_date: params[:approx_closing_date]}
      )