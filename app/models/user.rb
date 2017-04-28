

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :first_name, :last_name, :address, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

  has_many :clients
  has_many :notes
  # has_many :clients, through: :foreclosures
  # has_many :clients, through: :homebuyings
  # has_many :clients, through: :rentals
  # has_many :clients, through: :law_projects
  # has_many :clients, through: :senior_repairs

  has_many :budgets, through: :clients



  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end

  def sanitize_phone
    if home_phone
      home_phone.gsub!(/\D/, '')
    end
    if work_phone
      work_phone.gsub!(/\D/, '')
    end
    if cell_phone
      cell_phone.gsub!(/\D/, '')
    end
  end

  def pretty_last_sign_in_at
    last_sign_in_at.strftime("%A, %b %d")
  end

  # def client_list
  #   clients = []
  #   foreclosures.each do |foreclosure|
  #     if foreclosure.client.id
  #     clients << foreclosure.client
  #     end
  #   end

  #   homebuyings.each do |homebuying|
  #     clients << homebuying.client
  #   end

  #   homebuyings.each do |homebuying|
  #     clients << foreclosure.client
  #   end

  #   foreclosures.each do |foreclosure|
  #     clients << foreclosure.client
  #   end

  #   foreclosures.each do |foreclosure|
  #     clients << foreclosure.client
  #   end

  #   foreclosures.each do |foreclosure|
  #     clients << foreclosure.client
  #   end
  # end

end
