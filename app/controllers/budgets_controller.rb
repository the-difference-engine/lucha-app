class BudgetsController < ApplicationController
  before_action :authenticate_client!
  respond_to :html, :json

  def index
  end

  def update
    budget = current_client.budget
    if params[:income]
      form_params = income_params
      form_name = 'Income'
    elsif params[:debt]
      form_params = debt_params
      form_name = 'Debt'
    elsif params[:assets]
      form_params = asset_params
      form_name = 'Assets'
    end 
    
    if budget.update(form_params)
      budget.update(
        gross_monthly_income: budget.gross_monthly_income, 
        total_monthly_debt: budget.total_monthly_debt,
        debt_divided_by_income: budget.debt_income_ratio)
      render json: { success: "Your '#{form_name} Data' has been updated." }.to_json
    else
      render json: { danger: "Error saving '#{form_name} Data'.", budget: budget.errors.full_messages }.to_json
    end
  end

  def income_params
    params.require(:income).permit(:gross_wages, :self_employment_income, :overtime, :unemployment, :tips_commissions_bonus, :nontaxable_social_security, :taxable_social_security, :rental_income, :other_income)
  end

  def debt_params
    params.require(:debt).permit(:principal_and_interest, :prop_tax, :assoc_fees, :junior_mortgage, :min_credit_card_payment, :student_loan, :gas, :electricity, :water, :phone, :other_utilities, :food, :gas_car_maintenance, :child_care, :medical_expenses, :rent, :rental_insurance)
  end

  def asset_params
    params.require(:assets).permit(:primary_checking, :secondary_checking, :savings_money_market, :stocks_or_bonds, :four_zero_one_k, :home_equity, :other_property, :car, :other_assets)
  end

 
end
