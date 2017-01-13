# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  position               :string
#  home_phone             :string
#  work_phone             :string
#  cell_phone             :string
#  permissions            :integer
#

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

  def client_list
    clients = []
    foreclosures.each do |foreclosure| 
      if foreclosure.client.id
      clients << foreclosure.client 
      end 
    end
    
    homebuyings.each do |homebuying| 
      clients << homebuying.client 
    end 

    homebuyings.each do |homebuying| 
      clients << foreclosure.client 
    end 

    foreclosures.each do |foreclosure| 
      clients << foreclosure.client 
    end 

    foreclosures.each do |foreclosure| 
      clients << foreclosure.client 
    end 

    foreclosures.each do |foreclosure| 
      clients << foreclosure.client 
    end 
  end

end
