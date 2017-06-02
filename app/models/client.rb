

class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, :email, :authorization_and_waiver, :privacy_policy_authorization, presence: true
  validates :privacy_policy_authorization, inclusion: [true, false]
  validates :authorization_and_waiver, inclusion: [true, false]
  validates_uniqueness_of :email
  # validates_uniqueness_of :ssn
  # validates_numericality_of :num_in_household
  # validates_numericality_of :num_of_dependants

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :sex, :race, :ssn, :preferred_contact_method, :preferred_language, :marital_status, :dob, :education_level, :estimated_household_income, :num_in_household, :num_of_dependants, presence: true, on: :update
  validates :ssn, length: { is: 9, message: :bad_ssn }, on: :update

  validates :work_phone, :cell_phone, :home_phone, length: {minimum: 10}, :allow_blank => true

  # validates_associated :budget

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user
  has_many :notes

  has_one :foreclosure, dependent: :destroy
  has_one :homebuying, dependent: :destroy
  has_one :rental, dependent: :destroy
  has_one :law_project, dependent: :destroy
  has_one :senior_repair, dependent: :destroy
  has_one :budget, dependent: :destroy

  before_create :make_budget

  serialize :ssn, EncryptedCoder.new

  def self.unassigned_client
    where(user_id: nil)
    #.where.not(sex: nil, race: nil, ssn: nil, preferred_contact_method: nil, preferred_language: nil, marital_status: nil, dob: nil, num_in_household: nil, num_of_dependants: nil, education_level: nil, estimated_household_income: nil) 
  end

  #checks if client has completed profile
  #if dob is nil, due to other validations :on update - signifies complete profile
  def incomplete_profile?
    dob == nil
  end

  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end

  def full_name_pdf
    "#{first_name}#{last_name}"
  end

  def has_user?
    !!user
  end

  def full_address
    "#{address}, #{city} #{state} #{zip_code}"
  end

  def user_fullname
    "#{user.first_name.titleize} #{user.last_name.titleize}"
  end

  def encoded_ssn
    if ssn != nil
      "***-**-****"
    else
      "Not Submitted"
    end
  end

  def user_email
    "#{user.email}"
  end

  def filled_columns
    # If I need to check in RSpec, run the code below
    # attributes.each { |k, v| puts "#{k} => # {v.blank?}"}
    filled_count = 0
    attributes.each do |k, v|
      if v != nil
        filled_count+=1
      end
    end
    filled_count - 4
    # Subtracting 4 from the number of filled_columns as those columns are created automatically by Devise and has no client input
  end

  def total_application_progress


  end

  def client_applications
    program_types = [foreclosure, homebuying, rental]
    client_enrolled_programs = []
    program_types.each do |program|
      if !program.blank?
        client_enrolled_programs << program
      end
    end
    client_enrolled_programs
  end

  def blank_applications
    applications = [foreclosure, homebuying, rental]
    application_names = ["foreclosure", "homebuying", "rental"]
    blank_applications = []
    applications.each_with_index do |application, index|
      if application.blank?
        blank_applications << application_names[index]
      end
    end
    blank_applications
  end

  def client_types
    type = []
    client_applications.each do |program|
      type << program.class.name
    end
    type
  end

  def self.to_csv(options = {})
    attributes = %w{
                    id 
                    account_created 
                    name 
                    encoded_ssn
                    email 
                    contact_method 
                    submmitted_application 
                    address 
                    ward 
                    home_phone 
                    work_phone 
                    cell_phone 
                    preferred_language
                    other_language
                    marital_status
                    date_of_birth
                    head_of_household 
                    num_in_household
                    num_of_dependants
                    education_level
                    disability
                    disability_in_household
                    over_sixty_two
                    union_member
                    military_service_member
                    volunteer_interest
                    estimated_household_income
                    authorization_and_waiver
                    privacy_policy_authorization
                    employee_assigned
                  }

      CSV.generate(options) do |csv|
        csv << attributes
        all.each do |client|
          csv.add_row([
            client.id,
            client.created_at,
            client.full_name,
            client.encoded_ssn,
            client.email,
            client.preferred_contact_method,
            client.client_types.join(", "),
            client.full_address,
            client.ward,
            client.home_phone,
            client.work_phone,
            client.cell_phone,
            client.preferred_language,
            client.other_language,
            client.marital_status,
            client.dob,
            client.head_of_household,
            client.num_in_household,
            client.num_of_dependants,
            client.education_level,
            client.disability,
            client.disability_in_household,
            client.over_sixty_two,
            client.union_member,
            client.military_service_member,
            client.volunteer_interest,
            client.estimated_household_income,
            client.authorization_and_waiver,
            client.privacy_policy_authorization,
            client.user_id ? client.user.full_name : "not assigned"
            ])
        end
      end
  end

  def counselors

    counselor_array = []
    applied_programs = client_applications
    applied_programs.each do |program|
      unless program.program_employees[0].blank?
        counselor_array << program.program_employees[0].user
      end
    end
    if counselor_array.all? &:blank?
      counselor_array == nil
    else
      counselor_array
    end
    counselor_array
  end

  private

  def make_budget
    build_budget || true
  end


end
