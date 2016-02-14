class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_many :client_programs
  has_many :foreclosures
  has_many :homebuyings
  has_many :rentals
  has_many :law_projects
  has_many :law_projects



end
