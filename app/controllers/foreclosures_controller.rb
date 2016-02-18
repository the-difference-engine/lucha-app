class ForeclosuresController < ApplicationController

	def index
    @foreclosure = Foreclosure.where(client_id: params[:id])	
	end

	def create
    @foreclosure = Foreclosure.new({currently_foreclosed: params[:currently_foreclosed], 
        })

    if @foreclosure.save
    flash[:success] = "You've completed the foreclosure application"
    redirect_to "/clients"
    else
      render :create
    end
  end
	
	def edit
    @foreclosure = Foreclosure.where(client_id: params[:id])

	end

	def update
		@foreclosure = Foreclosure.where(client_id: params[:id])
		if @foreclosure.update 
	end

	def show
		
	end

end
