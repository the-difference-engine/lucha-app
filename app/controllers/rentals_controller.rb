class RentalsController < ApplicationController
  before_action :authenticate_client!, only: [:new, :create]
  respond_to :html, :json, :csv

  def new
    @rental = Rental.new
  end

  def index
    @rentals = Rental.all.order('created_at desc')

    respond_to do |format|
      format.html
      format.csv { send_data @rentals.to_csv, filename: "rentals-#{Date.today}.csv" } #untested
      format.xls { send_data @rentals.to_csv(col_sep: "\t") } #untested
    end
  end

  def create
    @id = current_client.id
    @rental = Rental.new(rental_params.merge(client_id: @id))
  	if @rental.save
    	flash[:success] = ["You've completed the rental application"]
    	redirect_to "/clients/#{@rental.client_id}/status"
  	else
  		flash.now[:danger] = @rental.errors.full_messages
    	render :new
  	end
  end

	def show
    @rental = Rental.find(params[:id]) if current_user
    @rental = current_client.rental if current_client
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
      @rental = Rental.find(params[:id])
    end

    if @rental.update(rental_params.merge(client_id: @rental.client_id))
      flash[:success] = "Rental application submitted."
      redirect_to "/rentals/#{@rental.id}"
    else
      flash.now[:warning] = @rental.errors.full_messages
      render :edit
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    if @rental.destroy
      flash[:danger] = "Rental application deleted."
      redirect_to "/clients/#{current_client.id}"
    else
      flash[:warning] = "Rental NOT deleted"
      redirect_to "/rentals/#{@rental.id}"
    end
  end

  private

  def phone_sanitizer(params_hash)
    params_hash.each do |key, value|
      value.gsub!(/\D/, '') if key.include? 'phone'
    end
  end

  def rental_params
    phone_sanitizer(params.permit(
      :evictions,
      :waitlist_num,
      :bedrooms,
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
    ))
  end
end
