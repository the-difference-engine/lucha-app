class RentalsController < ApplicationController
	before_action :authenticate_client!, only: [:new, :create]
	respond_to :html, :json

	def new
		@rental = Rental.new
	end

	def create
		@id = current_client.id
		@rental = Rental.new(rental_params.merge(client_id: @id))

    if @rental.save
	    flash[:success] = ["You've completed the rental application"]
	    redirect_to "/clients/#{@rental.client_id}/status"
    else
    	flash[:danger] = @rental.errors.full_messages
      render :new
    end
  end
	
	def show
		@rental = Rental.find(params[:id])
	end

	def edit
		if client_signed_in?
			@rental = current_client.rental
    elsif user_signed_in?
      @rental = Rental.find(params[:id])
    end
	end

	def update
    if current_client
      @rental = Rental.find_by(client_id: current_client.id)
    elsif current_user
      @rental = Rental.where(client_id: params[:id])
    end

		@rental = Rental.where(client_id: params[:id])
		if @rental.update(rental_params)
			flash[:success] = "rental application submitted."
			redirect_to "/clients/#{@rental.client_id}"
		else
			render :edit
		end
	end

	def destroy
		@rental = Rental.find(params[:id])
		client = @rental.client
		@rental.destroy
		flash[:danger] = "Rental application deleted."
		redirect_to "/clients/#{client.id}/status"
	end

  private

  def rental_params
    params.permit(
			:evictions,
			:waitlist_num,
			:studio,
			:two_bed,
			:three_bed,
			:wheelchair_accessible,
			:car_owner,
			:pet_owner,
			:kind_of_pet,
			:hear_of_property,
			:reasons_for_application,
			:landlord_name,
			:landlord_address,
			:landlord_phone,
			:occupancy_at_apartment,
			:monthly_rent,
			:fuel_electric,
			:pre_landlord_name,
			:pre_landlord_address,
			:pre_landlord_phone,
			:pre_rent,
			:pre_fuel_electric,
			:reason_for_move,
			:housing_situation,
			:employer_name,
			:employer_address,
			:employer_city,
			:employer_state,
			:employer_phone,
			:position,
			:length_employed,
			:personal_reference_name,
			:per_ref_address,
			:per_ref_street,
			:per_ref_state,
			:per_ref_phone,
			:per_ref_relationship,
			:displaced,
			:homeless,
			:over_fifty_percent,
			:agree_to_fee
			)
  end

end
