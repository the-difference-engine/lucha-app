class HomebuyingsController < ApplicationController
	def index
    @homebuying = Homebuying.where(client_id: params[:id])	
	end

	def new
		@homebuying = Homebuying.new
	end


	def create
    if client_signed_in?
	    @homebuying = Homebuying.new({lender: params[:lender], client_id: current_client.id,
	    	











	    	})
	    if @homebuying.save
	    flash[:success] = "You've completed the homebuying application"
	    redirect_to "/clients/#{@homebuying.client_id}"
	    else
	      render :create
	    end

	  elsif user_signed_in?
	    @homebuying = Homebuying.new({lender: params[:lender], client_id: paramms[:client_id] })
	    if @homebuying.save
	    flash[:success] = "You've completed the homebuying application"
	    redirect_to "/clients/#{@homebuying.client_id}"
	    else
	      render :create
	    end
	  end
  end
	

	def edit
    @homebuying = Homebuying.where(client_id: params[:id])
	end

	def update
		@homebuying = Homebuying.where(client_id: params[:id])
		if @homebuying.update({lender: params[:lender], 
        })
			flash[:success] = "homebuying application submitted."
			redirect_to '/clients/#{@homebuying.client_id}'
		else
			render :edit
		end
	end

	def show
		@homebuying = Homebuying.where(client_id: params[:id])
	end

end
