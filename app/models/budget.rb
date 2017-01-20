# == Schema Information
#
# Table name: budgets
#
#  id                         :integer          not null, primary key
#  gross_wages                :decimal(8, 2)    default(0.0)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  self_employment_income     :decimal(8, 2)    default(0.0)
#  overtime                   :decimal(8, 2)    default(0.0)
#  unemployment               :decimal(8, 2)    default(0.0)
#  tips_commissions_bonus     :decimal(8, 2)    default(0.0)
#  nontaxable_social_security :decimal(8, 2)    default(0.0)
#  taxable_social_security    :decimal(8, 2)    default(0.0)
#  rental_income              :decimal(8, 2)    default(0.0)
#  other_income               :decimal(8, 2)    default(0.0)
#  primary_checking           :decimal(8, 2)    default(0.0)
#  secondary_checking         :decimal(8, 2)    default(0.0)
#  savings_money_market       :decimal(8, 2)    default(0.0)
#  stocks_or_bonds            :decimal(8, 2)    default(0.0)
#  four_zero_one_k            :decimal(8, 2)    default(0.0)
#  home_equity                :decimal(8, 2)    default(0.0)
#  other_property             :decimal(8, 2)    default(0.0)
#  car                        :decimal(8, 2)    default(0.0)
#  other_assets               :decimal(8, 2)    default(0.0)
#  principal_and_interest     :decimal(8, 2)    default(0.0)
#  prop_tax                   :decimal(8, 2)    default(0.0)
#  assoc_fees                 :decimal(8, 2)    default(0.0)
#  junior_mortgage            :decimal(8, 2)    default(0.0)
#  min_credit_card_payment    :decimal(8, 2)    default(0.0)
#  car_payment                :decimal(8, 2)    default(0.0)
#  student_loan               :decimal(8, 2)    default(0.0)
#  gas                        :decimal(8, 2)    default(0.0)
#  electricity                :decimal(8, 2)    default(0.0)
#  water                      :decimal(8, 2)    default(0.0)
#  phone                      :decimal(8, 2)    default(0.0)
#  other_utilities            :decimal(8, 2)    default(0.0)
#  food                       :decimal(8, 2)    default(0.0)
#  auto_insurance             :decimal(8, 2)    default(0.0)
#  gas_car_maintenance        :decimal(8, 2)    default(0.0)
#  child_care                 :decimal(8, 2)    default(0.0)
#  medical_expenses           :decimal(8, 2)    default(0.0)
#  clothing                   :decimal(8, 2)    default(0.0)
#  rent                       :decimal(8, 2)    default(0.0)
#  rental_insurance           :decimal(8, 2)    default(0.0)
#  total_monthly_debt         :decimal(8, 2)    default(0.0)
#  gross_monthly_income       :decimal(8, 2)    default(0.0)
#  debt_divided_by_income     :decimal(8, 2)    default(0.0)
#  client_id                  :integer
#

class Budget < ActiveRecord::Base
  validates_uniqueness_of :client_id
  validates_presence_of :client
  
	belongs_to :client

  def debt_income_ratio
    return 0 if total_monthly_debt.zero? || gross_monthly_income.zero?
    total_monthly_debt / gross_monthly_income
  end


end
