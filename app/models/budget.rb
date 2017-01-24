
class Budget < ActiveRecord::Base
  validates_presence_of :client

	belongs_to :client

  def debt_income_ratio
    return 0 if total_monthly_debt.zero? || gross_monthly_income.zero?
    total_monthly_debt / gross_monthly_income
  end


end
