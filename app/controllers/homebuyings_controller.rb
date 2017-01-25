class HomebuyingsController < ApplicationController
  skip_before_action :authenticate_client!
  respond_to :html, :json

  def index
    if current_client || current_user
      @homebuyings = Homebuying.all
    else
      redirect_to "/"
    end
  end

  def new
    if current_client
      @homebuying = Homebuying.new
    else
      redirect_to "/"
    end
  end


  def create
    if current_client || current_user
      @id = current_client.id if current_client
      @id = current_user.id if current_user

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
        flash[:success] = "Successfully Completed Hombuying Application"
        redirect_to "/homebuyings/#{@homebuying.id}"
      else
        flash[:danger] = @homebuying.errors.full_messages
        render :new
      end
    else
      redirect_to "/"
    end
  end

  def show
    if current_client || current_user
      @homebuying = Homebuying.find(params[:id]) if current_user
      @homebuying = current_client.homebuying if current_client
    else
      redirect_to "/"
    end
  end

  def edit
    if current_client || current_user
      @homebuying = Homebuying.find(params[:id]) if current_user
      @homebuying = current_client.homebuying if current_client
    else
      redirect_to "/"
    end
  end

  def update
    if current_client || current_user
      @homebuying = Homebuying.find(params[:id]) if current_user
      @homebuying = current_client.homebuying if current_client
      if @homebuying.update(homebuying_params)
        flash[:success] = "Homebuying Application Updated"
        redirect_to "/homebuyings/#{@homebuying.id}"
      else
        flash[:warning] = "update unsuccessful"
        render :edit
      end
    else
      redirect_to "/"
    end
  end

  def destroy
    if current_client || current_user
      @homebuying = Homebuying.find(params[:id]) if current_user
      @homebuying = current_client.homebuying if current_client
      if @homebuying.destroy
        flash[:danger] = "Homebuying Application Deleted."
        redirect_to "/clients/#{current_client.id}"
      else
        flash[:warning] = "application was not deleted"
        render :show
      end
    else
      redirect_to "/"
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
