class UsersController < ApplicationController
  def index
  
  end

  def show
  
  end

  def new
  	
  end

  def create
   @user = User.new({first: params[:name],
            price: params[:price], 
            description: params[:description], 
            supplier_id: params[:supplier][:supplier_id]
            })

  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
  	
  end
end
