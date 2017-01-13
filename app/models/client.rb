# == Schema Information
#
# Table name: clients
#
#  id                           :integer          not null, primary key
#  email                        :string           default(""), not null
#  encrypted_password           :string           default(""), not null
#  reset_password_token         :string
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0), not null
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :string
#  last_sign_in_ip              :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  first_name                   :string
#  last_name                    :string
#  race                         :string
#  sex                          :string
#  home_phone                   :string
#  work_phone                   :string
#  cell_phone                   :string
#  address                      :string
#  city                         :string
#  state                        :string
#  ward                         :integer
#  zip_code                     :string
#  ssn                          :string
#  preferred_contact_method     :string
#  preferred_language           :string
#  marital_status               :string
#  dob                          :date
#  head_of_household            :boolean          default(FALSE), not null
#  num_in_household             :integer
#  num_of_dependants            :integer
#  education_level              :string
#  disability                   :boolean          default(FALSE), not null
#  union_member                 :boolean          default(FALSE), not null
#  military_service_member      :boolean          default(FALSE), not null
#  volunteer_interest           :boolean          default(FALSE), not null
#  estimated_household_income   :string
#  authorization_and_waiver     :boolean
#  privacy_policy_authorization :boolean
#  user_id                      :integer
#  assign                       :boolean
#

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

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :sex, :race, :ssn, :preferred_contact_method, :preferred_language, :marital_status, :dob, :education_level, :estimated_household_income, :num_in_household, :num_of_dependants, presence: true, on: :update

  # validates_associated :budget

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :user
  has_many :notes, through: :user

  has_one :foreclosure, dependent: :destroy
  has_one :homebuying, dependent: :destroy
  has_one :rental, dependent: :destroy
  has_one :law_project, dependent: :destroy
  has_one :senior_repair, dependent: :destroy
  has_one :budget, dependent: :destroy

  before_create :make_budget

  def self.incomplete_profile
    where(user_id: nil).where.not(sex: nil, race: nil, ssn: nil, preferred_contact_method: nil, preferred_language: nil, marital_status: nil, dob: nil,  num_in_household: nil, num_of_dependants: nil, education_level: nil, estimated_household_income: nil)
  end

  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end

  def has_user?
    user
  end

  def user_fullname
    "#{user.first_name.titleize} #{user.last_name.titleize}"
  end

  def column_count
    attributes.length - 4
    # Can only be called on an instance
    # Subtracting 4 from the number of attributes as those are created when the client makes an account
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
    program_types = [foreclosure, homebuying, rental, senior_repair, law_project]
    client_enrolled_programs = []
    program_types.each do |program|
      if !program.blank?
        client_enrolled_programs << program
      end
    end
    client_enrolled_programs
  end


  def client_types
    type = []
    client_applications.each do |program|
      type << program.class.name
    end
    type
  end

  def self.to_csv(options = {})
    # Eventually, I need a way to make this class dynamic, as a way for me to be able to check what kinds of applications there are. I can use the model method I created called Client_applications, but there has to be some way for the csv method to know. It will be easy enough being able to print out all of the methods there are, but then I have ugly empty columns in my CSV file.
    CSV.generate(options) do |csv|
      csv << column_names + Foreclosure.column_names
      all.each do |client|
      values = client.attributes.values
        if client.foreclosures[0]
          values += client.foreclosures[0].attributes.values
        end
      csv.add_row values
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
