class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :user

  has_many :foreclosures
  has_many :homebuyings
  has_many :rentals
  has_many :law_projects
  has_many :home_repairs

  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end

  def client_program_type
    if !foreclosures.blank?
      "Foreclosures"
    elsif !homebuyings.blank?
      "Homebuyings"
    elsif !rentals.blank?
      "Rentals"
    elsif !senior_repairs.blank?
      "SeniorRepairs"
    elsif !law_projects.blank?
      "LawProjects"
    else
      "No applications yet"
    end
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
    # Subtracting 4 from the number of filled_columns as those columns are created automatically by Devise and has not client input
    filled_count - 4

  end

end
