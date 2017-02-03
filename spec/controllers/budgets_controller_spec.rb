require 'rails_helper'

RSpec.describe BudgetsController, type: :controller do
  include Devise::TestHelpers

  describe "PATCH #update" do
    context "current_client logged in" do
      before :each do
        @client = create(:client)
        sign_in @client
        @budget = create(:budget, client_id: @client.id)
      end
      it "locates the client's budget" do
        patch :update, id: @budget
        expect(assigns(:budget)).to eq(@budget)
      end
      context "with VALID attributes" do
        it "updates the requested @budget" do
          @budget.update(gross_wages: 5.67, self_employment_income: 1.23)
          expect(@budget.gross_wages).to eq(5.67)
          expect(@budget.self_employment_income).to eq(1.23)
        end
        it "renders a flash hash with a success message" do
          patch :update, id: @budget,
            budget: attributes_for(:budget,
              gross_wages: 5.67,
              self_employment_income: 1.23
            )
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)).to eq({"success"=>"Your budget has been updated."})
        end
      end
      context "with INVALID attributes" do
        it "does NOT update the requested @budget" do
          patch :update, id: @budget,
            budget: attributes_for(:budget,
              gross_wages: "dogs",
              self_employment_income: "cats"
            )
          expect(@budget.gross_wages).to eq(5.0)
          expect(@budget.self_employment_income).to eq(5.0)
        end
        it "renders a flash hash with an error message" do
          allow_any_instance_of(Budget).to receive(:save).and_return(false)
          patch :update, id: @budget,
            budget: attributes_for(:budget,
              gross_wages: "dogs",
              self_employment_income: "cats"
            )
          expect(response.status).to eq(422)
          expect(JSON.parse(response.body)).to eq("error"=>{})
        end
      end
    end
    context "current_client NOT logged in" do
      before :each do
        @client = create(:client)
        @budget = create(:budget, client_id: @client.id)
      end
      it "redirects to unauthenticated client page" do
        patch :update, id: @budget
        expect(response).to redirect_to "/"
      end
    end
  end

end
