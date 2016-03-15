class AddColumnsToLawProject < ActiveRecord::Migration
  def change
    add_column :law_projects, :current_evicted, :boolean, default: false
    add_column :law_projects, :community_group, :boolean, default: false
    add_column :law_projects, :tech_assistance, :boolean, default: false
    add_column :law_projects, :frclsr_prevention, :boolean, default: false
    add_column :law_projects, :low_income_family, :boolean, default: false
    add_column :law_projects, :displacement, :boolean, default: false
    add_column :law_projects, :substandard_housing, :boolean, default: false
    add_column :law_projects, :disabilities, :boolean, default: false
    add_column :law_projects, :lucha_tenant, :boolean, default: false
    add_column :law_projects, :law_project_chargable, :boolean, default: false
    add_column :law_projects, :other, :string
    add_column :law_projects, :census_tract, :string
  end
end
