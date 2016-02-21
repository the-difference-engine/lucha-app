class RentalsController < ApplicationController

	def index
    @rental = Rental.where(client_id: params[:id])	
	end

	def new
		@rental = Rental.new
	end


	def create
    if client_signed_in?
	    @rental = Rental.new({evictions: params[:evictions], client_id: current_client.id })
	    if @rental.save
	    flash[:success] = "You've completed the rental application"
	    redirect_to "/clients/#{@rental.client_id}"
	    else
	      render :create
	    end

	  elsif user_signed_in?
	    @rental = Rental.new({evictions: params[:evictions], client_id: paramms[:client_id] })
	    if @rental.save
	    flash[:success] = "You've completed the rental application"
	    redirect_to "/clients/#{@rental.client_id}"
	    else
	      render :create
	    end
	  end
  end
	

	def edit
    @rental = Rental.where(client_id: params[:id])
	end

	def update
		@rental = Rental.where(client_id: params[:id])
		if @rental.update({evictions: params[:evictions], 
        })
			flash[:success] = "rental application submitted."
			redirect_to '/clients/#{@rental.client_id}'
		else
			render :edit
		end
	end

	def show
		@rental = Rental.where(client_id: params[:id])
	end



end
