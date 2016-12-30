# == Schema Information
#
# Table name: law_projects
#
#  id                    :integer          not null, primary key
#  violation_type        :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  client_id             :integer
#  current_evicted       :boolean          default(FALSE)
#  community_group       :boolean          default(FALSE)
#  tech_assistance       :boolean          default(FALSE)
#  frclsr_prevention     :boolean          default(FALSE)
#  low_income_family     :boolean          default(FALSE)
#  displacement          :boolean          default(FALSE)
#  substandard_housing   :boolean          default(FALSE)
#  disabilities          :boolean          default(FALSE)
#  lucha_tenant          :boolean          default(FALSE)
#  law_project_chargable :boolean          default(FALSE)
#  other                 :string
#  census_tract          :string
#

class LawProject < ActiveRecord::Base
	validates_uniqueness_of :client_id
	validates_presence_of :client
	

	has_many :program_employees, as: :programable
	belongs_to :client

end
