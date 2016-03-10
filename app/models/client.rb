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
  has_many :senior_repairs

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
    # Subtracting 4 from the number of filled_columns as those columns are created automatically by Devise and has not client input
    filled_count - 4
  end

  def client_applications
    program_types = [foreclosures, homebuyings, rentals, senior_repairs, law_projects]
    client_enrolled_programs = []
    program_types.each do |program, programable_type|
      if !program.blank?
        client_enrolled_programs << program
      end
    end
    client_enrolled_programs
  end

  # def application_program_types
  #   program_array = []
  #   client_applications.each do |program|
  #     ProgramEmployees.create(programable_id: program.id, programable_type: program.class)
  #   end
  #   program_array
  # end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |client|
        csv << client.attributes.values_at(*column_names)
      end
    end
  end

end
