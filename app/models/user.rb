class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :program_employees
  has_many :foreclosures, through: :program_employees, source: :programable, source_type: "Foreclosure"
  has_many :homebuyings, through: :program_employees, source: :programable, source_type: "Homebuying"
  has_many :rentals, through: :program_employees, source: :programable, source_type: "Rental"
  has_many :law_projects, through: :program_employees, source: :programable, source_type: "LawProject"
  has_many :senior_repairs, through: :program_employees, source: :programable, source_type: "SeniorRepair"


  # has_many :foreclosures, through: :program_employees, source: :programable, source_type: "Foreclosure"
  # has_many :homebuyings, through: :program_employees, source: :programable, source_type: "Homebuying"
  # has_many :rentals, through: :program_employees, source: :programable, source_type: "Rental"
  # has_many :law_projects, through: :program_employees, source: :programable, source_type: "law_project"
  # has_many :senior_repairs, through: :program_employees, source: :programable, source_type: "Senior_repair"

  has_many :clients, through: :foreclosures
  has_many :clients, through: :homebuyings
  has_many :clients, through: :rentals
  has_many :clients, through: :law_projects
  has_many :clients, through: :senior_repairs

  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end


end
