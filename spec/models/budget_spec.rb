require 'rails_helper'
require 'spec_helper'

RSpec.describe Budget, type: :model do

    describe Rental do
        describe "Validations" do
            it "is valid with valid attributes" do
              budget = build(:budget)
              expect(budget).to be_valid
            end
            context "should allow only numeraclity answers" do
                before(:each) do
                    @client = create(:client)
                end
                it "will default invalid values to 0.0" do
                    budget = build(:budget, gross_wages: 'dogs')
                    expect(budget.gross_wages).to eq(0.0)
                end
                it "is invalid without with value entered as text" do
                    budget = build(:budget, gross_wages: 'dogs')
                    budget.valid?
                    expect(budget.errors[:gross_wages]).to include("is not a number")
                end
            end 
        end
        describe "gross_monthly_income" do
            it "returns the sum of all income attributes" do
                budget = build(:budget)
                income_sum = budget.gross_wages +
                        budget.self_employment_income +
                        budget.overtime +
                        budget.unemployment +
                        budget.tips_commissions_bonus + 
                        budget.nontaxable_social_security +
                        budget.taxable_social_security +
                        budget.rental_income + 
                        budget.other_income
                expect(budget.gross_monthly_income).to eq(income_sum)
            end
        end
        describe "total_monthly_debt" do
            it "returns the sum of all debt attributes" do
                budget = build(:budget)
                debt_sum = budget.principal_and_interest +
                            budget.prop_tax +
                            budget.assoc_fees +
                            budget.junior_mortgage + 
                            budget.min_credit_card_payment +
                            budget.student_loan +
                            budget.gas +
                            budget.electricity +
                            budget.water +
                            budget.phone +
                            budget.other_utilities +
                            budget.food +
                            budget.gas_car_maintenance +
                            budget.child_care +
                            budget.medical_expenses +
                            budget.rent +
                            budget.rental_insurance
                expect(budget.gross_monthly_income).to eq(debt_sum)
            end
        end
        describe "debt_income_ratio" do
            it "returns the ratio of debt to income" do
                budget = build(:budget)
                ratio = budget.total_monthly_debt / budget.gross_monthly_income
                expect(budget.debt_income_ratio).to eq(ratio)
            end
            it "returns zero if gross_monthly_income is equal to zero" do
                budget = build(:budget, 
                            gross_wages: 0.0,
                            self_employment_income: 0.0,
                            overtime: 0.0,
                            unemployment: 0.0,
                            tips_commissions_bonus: 0.0,
                            nontaxable_social_security: 0.0,
                            taxable_social_security: 0.0,
                            rental_income: 0.0,
                            other_income: 0.0)

                expect(budget.debt_income_ratio).to eq(0)
            end
        end
    end

end
