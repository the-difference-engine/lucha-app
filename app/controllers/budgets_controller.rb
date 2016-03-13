class BudgetsController < ApplicationController
  skip_before_action :authenticate_client!

  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def create
    
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
