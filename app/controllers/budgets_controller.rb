class BudgetsController < ApplicationController
  before_action :authenticate_client!
  respond_to :html, :json

  def show
    if current_client
        @client = current_client
    elsif current_user
        @client = Budget.find(params[:id]).client
    end
   
    @budget = @client.budget #.find(params[:id])
 
  end

 
  def update
    
    if current_client.budget.update(income_params)
        render json: "sweet it worked".to_json
    else
        render json: "failed".to_json, status: :unprocessable_entity
    end

  end

  def income_params
    params.require(:income).permit(:gross_wages, :self_employment_income, :overtime, :unemployment, :tips_commisions_bonus, :nontaxable_social_security, :taxable_social_security, :rental_income, :other_income)
  end

    # @budget = Budget.update({client_id: paramms[:client_id], 
    #     gross_wages: params[:gross_wages],
    #     self_employment_income: params[:self_employment_income],
    #     overtime: params[:overtime],
    #     unemployment: params[:unemployment], 
    #     tips_commisions_bonus: params[:tips_commisions_bonus],
    #     nontaxable_social_security: params[:nontaxable_social_security],
    #     taxable_social_security: params[:taxable_social_security], 
    #     rental_income: params[:rental_income], 
    #     other_income: params[:other_income], 
    #     primary_checking: params[:primary_checking] , 
    #     secondary_checking: params[:secondary_checking],
    #     savings_money_market: params[:savings_money_market], 
    #     stocks_or_bonds: params[:stocks_or_bonds],
    #     four_zero_one_k: params[:four_zero_one_k], 
    #     home_equity: params[:home_equity], 
    #     other_property: params[:other_property] , 
    #     car: params[:car],
    #     other_assets: params[:other_assets], 
    #     principal_and_interest: params[:principal_and_interest],         
    #     prop_tax: params[:prop_tax], 
    #     assoc_fees: params[:assoc_fees] , 
    #     junior_mortgage: params[:junior_mortgage],
    #     min_credit_card_payment: params[:min_credit_card_payment], 
    #     student_loan: params[:student_loan],        
    #     gas: params[:gas],        
    #     electricity: params[:electricity],        
    #     water: params[:water],        
    #     phone: params[:phone],        
    #     other_utilities: params[:other_utilities],        
    #     food: params[:food],        
    #     gas_car_maintenance: params[:gas_car_maintenance],        
    #     child_care: params[:child_care],        
    #     medical_expenses: params[:medical_expenses],        
    #     rent: params[:rent],        
    #     rental_insurance: params[:rental_insurance], 
    #     total_monthly_debt: params[:total_monthly_debt], gross_monthly_income: params[:gross_monthly_income],        
    #     debt_divided_by_income: params[:debt_divided_by_income]       
    #    })

    # if user_signed_in?
    #     @client = Client.find(params[:id])
    # elsif client_signed_in?
    #     @client = current_client
    # end
  

 
end
