class Api::BudgetsController < ApplicationController

  def show
    if current_client
        @client = current_client
    elsif current_user
        @client = Budget.find(params[:id]).client
    end
    @income = Budget.find_by(id: current_client.id).first(8)
  end

end
