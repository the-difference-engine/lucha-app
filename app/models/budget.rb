
class Budget < ActiveRecord::Base
  NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
  VALIDATABLE_ATTRS = Budget.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}

  validates_presence_of :client
  validates_numericality_of VALIDATABLE_ATTRS

	belongs_to :client 

  def debt_income_ratio
    return 0 if total_monthly_debt.zero? || gross_monthly_income.zero?
    total_monthly_debt / gross_monthly_income
  end

  def gross_monthly_income
    [gross_wages, self_employment_income, overtime, unemployment, tips_commissions_bonus, nontaxable_social_security, taxable_social_security, rental_income, other_income].map(&:to_f).inject(:+) 
  end

  def total_monthly_debt
    [principal_and_interest, prop_tax, assoc_fees, junior_mortgage, min_credit_card_payment, student_loan, gas, electricity, water, phone, other_utilities, food, gas_car_maintenance, child_care, medical_expenses, rent, rental_insurance].map(&:to_f).inject(:+) 
  end

  def edited?
    created_at < updated_at
  end

end
