json.set! :income do
  json.set! :gross_wages, @budget.gross_wages
  json.set! :self_employment_income, @budget.self_employment_income
  json.set! :overtime, @budget.overtime
  json.set! :unemployment, @budget.unemployment
  json.set! :tips_commissions_bonus, @budget.tips_commissions_bonus
  json.set! :nontaxable_social_security, @budget.nontaxable_social_security
  json.set! :taxable_social_security, @budget.taxable_social_security
  json.set! :rental_income, @budget.rental_income
  json.set! :other_income, @budget.other_income
  json.set! :gross_monthly_income, @budget.gross_monthly_income
end

json.set! :debt do
  json.set! :principal_and_interest, @budget.principal_and_interest
  json.set! :prop_tax, @budget.prop_tax
  json.set! :assoc_fees, @budget.assoc_fees
  json.set! :junior_mortgage, @budget.junior_mortgage
  json.set! :min_credit_card_payment, @budget.min_credit_card_payment
  json.set! :student_loan, @budget.student_loan
  json.set! :gas, @budget.gas
  json.set! :electricity, @budget.electricity
  json.set! :water, @budget.water
  json.set! :phone, @budget.phone
  json.set! :other_utilities, @budget.other_utilities
  json.set! :food, @budget.food
  json.set! :gas_car_maintenance, @budget.gas_car_maintenance
  json.set! :child_care, @budget.child_care
  json.set! :medical_expenses, @budget.medical_expenses
  json.set! :rent, @budget.rent
  json.set! :rental_insurance, @budget.rental_insurance
  json.set! :total_monthly_debt, @budget.total_monthly_debt
end

json.set! :assets do
  json.set! :primary_checking, @budget.primary_checking
  json.set! :secondary_checking, @budget.secondary_checking
  json.set! :savings_money_market, @budget.savings_money_market
  json.set! :stocks_or_bonds, @budget.stocks_or_bonds
  json.set! :four_zero_one_k, @budget.four_zero_one_k
  json.set! :home_equity, @budget.home_equity
  json.set! :other_property, @budget.other_property
  json.set! :car, @budget.car
  json.set! :other_assets, @budget.other_assets
end




