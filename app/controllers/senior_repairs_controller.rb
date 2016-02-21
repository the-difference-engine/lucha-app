class SeniorRepairsController < ApplicationController

	def index
    @senior_repair = SeniorRepair.where(client_id: params[:id])	
	end

	def new
		@senior_repair = SeniorRepair.new
	end


	def create
    if client_signed_in?
	    @senior_repair = SeniorRepair.new({contractor: params[:contractor], client_id: current_client.id })
	    if @senior_repair.save
	    flash[:success] = "You've completed the Senior Repair application"
	    redirect_to "/clients/#{@senior_repair.client_id}"
	    else
	      render :create
	    end

	  elsif user_signed_in?
	    @senior_repair = SeniorRepair.new({contractor: params[:contractor], client_id: paramms[:client_id] })
	    if @senior_repair.save
	    flash[:success] = "You've completed the Senior Repair application"
	    redirect_to "/clients/#{@senior_repair.client_id}"
	    else
	      render :create
	    end
	  end
  end
	

	def edit
    @senior_repair = SeniorRepair.where(client_id: params[:id])
	end

	def update
		@senior_repair = SeniorRepair.where(client_id: params[:id])
		if @senior_repair.update({contractor: params[:contractor], 
        })
			flash[:success] = "Senior Repair application submitted."
			redirect_to '/clients/#{@senior_repair.client_id}'
		else
			render :edit
		end
	end

	def show
		@senior_repair = SeniorRepair.where(client_id: params[:id])
	end


end
