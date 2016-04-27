class BudgetsController < ApplicationController
  before_action :authenticate_client!
  respond_to :html, :json

  def show
    if current_client
        @client = current_client
    elsif current_user
        @client = Budget.find(params[:id]).client
    end
    @budget = @client.budget 
    
  end

 
  def update
    budget = current_client.budget
    if params[:income]
        form_params = income_params
    elsif params[:debt]
        form_params = debt_params
    elsif params[:assets]
        form_params = asssets_params
    end

    if budget.update(form_params)
        budget.update({ gross_monthly_income: sum_income, total_monthly_debt: sum_debt })
        # binding.pry
        render json: { success: "yay! success you rock", budget: budget }.to_json
    else
        render json: "failed".to_json, status: :unprocessable_entity
    end
  end

  def sum_income
    return 0 unless params[:income]
    income_params.values.map(&:to_f).inject(:+) 
  end

  def sum_debt
    return 0 unless params[:debt]
    debt_params.values.map(&:to_f).inject(:+) 
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
