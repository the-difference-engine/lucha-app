
class Budget < ActiveRecord::Base
  NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
  VALIDATABLE_ATTRS = Budget.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}

  validates_presence_of :client
  validates_numericality_of VALIDATABLE_ATTRS

	belongs_to :client 

  # serialize :gross_wages, EncryptedCoder.new
  # serialize :self_employment_income, EncryptedCoder.new
  # serialize :overtime, EncryptedCoder.new
  # serialize :unemployment, EncryptedCoder.new
  # serialize :tips_commissions_bonus, EncryptedCoder.new
  # serialize :nontaxable_social_security, EncryptedCoder.new
  # serialize :taxable_social_security, EncryptedCoder.new
  # serialize :rental_income, EncryptedCoder.new
  # serialize :other_income, EncryptedCoder.new
  # serialize :primary_checking, EncryptedCoder.new
  # serialize :secondary_checking, EncryptedCoder.new
  # serialize :savings_money_market, EncryptedCoder.new
  # serialize :stocks_or_bonds, EncryptedCoder.new
  # serialize :four_zero_one_k, EncryptedCoder.new
  # serialize :home_equity, EncryptedCoder.new
  # serialize :other_property, EncryptedCoder.new
  # serialize :car, EncryptedCoder.new
  # serialize :other_assets, EncryptedCoder.new
  # serialize :principal_and_interest, EncryptedCoder.new
  # serialize :prop_tax, EncryptedCoder.new
  # serialize :assoc_fees, EncryptedCoder.new
  # serialize :junior_mortgage, EncryptedCoder.new
  # serialize :min_credit_card_payment, EncryptedCoder.new
  # serialize :car_payment, EncryptedCoder.new
  # serialize :student_loan, EncryptedCoder.new
  # serialize :gas, EncryptedCoder.new
  # serialize :electricity, EncryptedCoder.new
  # serialize :water, EncryptedCoder.new
  # serialize :phone, EncryptedCoder.new
  # serialize :other_utilities, EncryptedCoder.new
  # serialize :food, EncryptedCoder.new
  # serialize :auto_insurance, EncryptedCoder.new
  # serialize :gas_car_maintenance, EncryptedCoder.new
  # serialize :child_care, EncryptedCoder.new
  # serialize :medical_expenses, EncryptedCoder.new
  # serialize :clothing, EncryptedCoder.new
  # serialize :rent, EncryptedCoder.new
  # serialize :rental_insurance, EncryptedCoder.new
  # serialize :total_monthly_debt, EncryptedCoder.new
  # serialize :gross_monthly_income, EncryptedCoder.new
  # serialize :debt_divided_by_income, EncryptedCoder.new
  

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
