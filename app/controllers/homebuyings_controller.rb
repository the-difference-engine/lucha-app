class HomebuyingsController < ApplicationController
  skip_before_action :authenticate_client!
  respond_to :html, :json

  def index
    @homebuyings = Homebuying.all
  end

  def new
    @homebuying = Homebuying.new
  end

  def create
    @id = current_client.id if current_client
    @id = Client.find(params[:id]).id if current_user

    @homebuying = Homebuying.new({
      client_id: @id,
      lender: params[:lender],
      hear_of_workshop: params[:hear_of_workshop],
      contact_for_appointment: params[:contact_for_appointment],
      real_estate_contract: params[:real_estate_contract],
      realtor_name: params[:realtor_name],
      realtor_phone: params[:realtor_phone],
      property_address: params[:property_address],
      property_state: params[:property_state],
      property_city: params[:property_city],
      loan_officer_name: params[:loan_officer_name],
      loan_officer_email: params[:loan_officer_email],
      loan_officer_phone: params[:loan_officer_phone],
      payment_assistance_program: params[:payment_assistance_program],
      approx_closing_date: params[:approx_closing_date],
    })

    if @homebuying.save
      flash[:success] = ["You've completed the homebuying application"]
      redirect_to "/clients/#{@homebuying.client_id}/status"
    else
      flash[:danger] = @homebuying.errors.full_messages
      render :new
    end
  end

  def show
    @homebuying = Homebuying.find(params[:id]) if current_client
  end

  def edit
    @homebuying = current_client.homebuying if current_client
    # if current_client
    #   @homebuying = current_client.homebuying
    #
    # else
    #   @foreclosure = Homebuying.find(params[:id])
    # end
  end

  def update
    @homebuying = Homebuying.find(params[:id]) if current_user
    @homebuying = current_client.homebuying if current_client

    @homebuying.update(homebuying_params)

    if @homebuying.update(homebuying_params)
      flash[:success] = "homebuying application updated"
      redirect_to "/homebuyings/#{@homebuying.id}"
    else
      flash[:warning] = "update unsuccessful"
      render :edit
    end
  end

  def destroy
    @homebuying = Homebuying.find(params[:id])
    if @homebuying.destroy
      flash[:danger] = "homebuying application deleted."
      redirect_to "/clients/#{@homebuying.id}"
    else
      flash[:warning] = "application was not deleted"
      render :show
    end
  end

  private

  def homebuying_params
    params.permit(
      :lender,
      :hear_of_workshop,
      :contact_for_appointment,
      :real_estate_contract,
      :realtor_name,
      :realtor_phone,
      :property_address,
      :property_state,
      :property_city,
      :loan_officer_name,
      :loan_officer_email,
      :loan_officer_phone,
      :payment_assistance_program,
      :approx_closing_date,
    )
  end
end
