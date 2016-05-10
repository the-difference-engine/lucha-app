class RentalsController < ApplicationController
	skip_before_action :authenticate_client!
	respond_to :html, :json
	
	def index
    @rental = Rental.where(client_id: params[:id])	
	end

	def new
		@rental = Rental.new
	end

	def create
		if client_signed_in?
			@id = current_client.id
		elsif user_signed_in?
			@id = Rental.find(client_id: params[:id])[0].id
		end
	   
	  @rental = Rental.new({
    	client_id: @id,
    	evictions: params[:evictions], 
			waitlist_num: params[:waitlist_num],
			studio: params[:studio],
			two_bed: params[:two_bed],
			three_bed: params[:three_bed],
			wheelchair_accessible: params[:wheelchair_accessible],
			car_owner: params[:car_owner],
			pet_owner: params[:pet_owner],
			kind_of_pet: params[:kind_of_pet],
			hear_of_property: params[:hear_of_property],
			reasons_for_application: params[:reasons_for_application],
			landlord_name: params[:landlord_name],
			landlord_address: params[:landlord_address],
			landlord_phone: params[:landlord_phone],
			occupancy_at_apartment: params[:occupancy_at_apartment],
			monthly_rent: params[:monthly_rent],
			fuel_electric: params[:fuel_electric],
			pre_landlord_name: params[:pre_landlord_name],
			pre_landlord_address: params[:pre_landlord_address],
			pre_landlord_phone: params[:pre_landlord_phone],
			pre_rent: params[:pre_rent],
			pre_fuel_electric: params[:pre_fuel_electric],
			reason_for_move: params[:reason_for_move],
			housing_situation: params[:housing_situation],
			employer_name: params[:employer_name],
			employer_address: params[:employer_address],
			employer_city: params[:employer_city],
			employer_state: params[:employer_state],
			employer_phone: params[:employer_phone],
			position: params[:position],
			length_employed: params[:length_employed],
			personal_reference_name: params[:personal_reference_name],
			per_ref_address: params[:per_ref_address],
			per_ref_street: params[:per_ref_street],
			per_ref_state: params[:per_ref_state],
			per_ref_phone: params[:per_ref_phone],
			per_ref_relationship: params[:per_ref_relationship],
			displaced: params[:displaced],
			homeless: params[:homeless],
			over_fifty_percent: params[:over_fifty_percent],
			agree_to_fee: params[:agree_to_fee]
  	})

    if @rental.save
    	ProgramEmployee.create({programable_id: @rental.id, programable_type: "Rental"})
	    flash[:success] = ["You've completed the rental application"]
	    redirect_to "/clients/#{@rental.client_id}/status"
    else
    	flash[:danger] = @rental.errors.full_messages
      render :new
    end

	  # elsif user_signed_in?
	  #   @rental = Rental.new({evictions: params[:evictions], client_id: paramms[:client_id] })
	  #   if @rental.save
	  #   flash[:success] = "You've completed the rental application"
	  #   redirect_to "/clients/#{@rental.client_id}"
	  #   else
	  #     render :create
	  #   end
	  # end
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
		if @rental.update({evictions: params[:evictions],
				waitlist_num: params[:waitlist_num],
				studio: params[:studio],
				two_bed: params[:two_bed],
				three_bed: params[:three_bed],
				wheelchair_accessible: params[:wheelchair_accessible],
				car_owner: params[:car_owner],
				pet_owner: params[:pet_owner],
				kind_of_pet: params[:kind_of_pet],
				hear_of_property: params[:hear_of_property],
				reasons_for_application: params[:reasons_for_application],
				landlord_name: params[:landlord_name],
				landlord_address: params[:landlord_address],
				landlord_phone: params[:landlord_phone],
				occupancy_at_apartment: params[:occupancy_at_apartment],
				monthly_rent: params[:monthly_rent],
				fuel_electric: params[:fuel_electric],
				pre_landlord_name: params[:pre_landlord_name],
				pre_landlord_address: params[:pre_landlord_address],
				pre_landlord_phone: params[:pre_landlord_phone],
				pre_rent: params[:pre_rent],
				pre_fuel_electric: params[:pre_fuel_electric],
				reason_for_move: params[:reason_for_move],
				housing_situation: params[:housing_situation],
				employer_name: params[:employer_name],
				employer_address: params[:employer_address],
				employer_city: params[:employer_city],
				employer_state: params[:employer_state],
				employer_phone: params[:employer_phone],
				position: params[:position],
				length_employed: params[:length_employed],
				personal_reference_name: params[:personal_reference_name],
				per_ref_address: params[:per_ref_address],
				per_ref_street: params[:per_ref_street],
				per_ref_state: params[:per_ref_state],
				per_ref_phone: params[:per_ref_phone],
				per_ref_relationship: params[:per_ref_relationship],
				displaced: params[:displaced],
				homeless: params[:homeless],
				over_fifty_percent: params[:over_fifty_percent],
				agree_to_fee: params[:agree_to_fee]
        })
			flash[:success] = "rental application submitted."
			redirect_to "/clients/#{@rental.client_id}"
		else
			render :edit
		end
	end


	def destroy
		@rental = Rental.find(params[:id])
		@rental.destroy
		flash[:danger] = "Rental application deleted."
		redirect_to "/clients/#{params[:id]}/status"

	end

  private

  def rental_params
    params.require(:rental).permit(
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
