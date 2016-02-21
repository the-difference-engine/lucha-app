class ForeclosuresController < ApplicationController

	def index
    @foreclosure = Foreclosure.all	
	end

	def new
		@foreclosure = Foreclosure.new
	end


	def create
    if client_signed_in?
	    @foreclosure = Foreclosure.new({currently_foreclosed: params[:currently_foreclosed], client_id: current_client.id })
	    if @foreclosure.save
	    flash[:success] = "You've completed the foreclosure application"
	    redirect_to "/clients/#{@foreclosure.client_id}"
	    else
	      render :create
	    end

	  elsif user_signed_in?
	    @foreclosure = Foreclosure.new({currently_foreclosed: params[:currently_foreclosed], client_id: paramms[:client_id] })
	    @program = Program_employee.new({
	    	user_id: 
	    	})
	    if @foreclosure.save
	    flash[:success] = "You've completed the foreclosure application"
	    redirect_to "/clients/#{@foreclosure.client_id}"
	    else
	      render :create
	    end
	  end
  end
	

	def edit
    @foreclosure = Foreclosure.where(client_id: params[:id])
	end

	def update
		@foreclosure = Foreclosure.where(client_id: params[:id])
		if @foreclosure.update({currently_foreclosed: params[:currently_foreclosed], 
        })
			flash[:success] = "Foreclosure application submitted."
			redirect_to '/clients/#{@foreclosure.client_id}'
		else
			render :edit
		end
	end

	def show
		@foreclosure = Foreclosure.where(client_id: params[:id])
	end

end
