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

end
