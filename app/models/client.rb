class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, :email, :authorization_and_waiver, :privacy_policy_authorization, presence: true
  validates :privacy_policy_authorization, inclusion: [true, false]
  validates :authorization_and_waiver, inclusion: [true, false]
  validates_uniqueness_of :email
  validates_uniqueness_of :ssn
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_associated :homebuying

# ____
  # validates :email, confirmation: true
  # <%= text_field :person, :email %>
  # <%= text_field :person, :email_confirmation %>
  # Need to add a confirmation view in the html
# ____

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :user

  has_one :foreclosure, dependent: :destroy
  has_one :homebuying, :inverse_of => :client, dependent: :destroy
  has_one :rental, dependent: :destroy
  has_one :law_project, dependent: :destroy
  has_one :senior_repair, dependent: :destroy
  has_one :budget, dependent: :destroy



  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
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


end
