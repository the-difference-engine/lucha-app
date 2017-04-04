class HomebuyingsController < ApplicationController
  before_action :authenticate!
  respond_to :html, :json


  def index
    @homebuyings = Homebuying.all.order('created_at desc')


    respond_to do |format|
      format.html
      format.csv { send_data @homebuyings.to_csv, filename: "homebuyings-#{Date.today}.csv" } #untested
      format.xls { send_data @homebuyings.to_csv(col_sep: "\t") } #untested
    end
  end

  def new
    @homebuying = Homebuying.new
  end

  def create
    @id = current_client.id if current_client
    @id = current_user.id if current_user
    @homebuying = Homebuying.new({
      client_id: @id,
      lender: params[:lender],
      loan_type: params[:loan_type],
      contact_for_appointment: params[:contact_for_appointment],
      real_estate_contract: params[:real_estate_contract],
      realtor_name: params[:realtor_name],
      realtor_phone: params[:realtor_phone],#.gsub!(/\D/, ''),
      property_address: params[:property_address],
      property_state: params[:property_state],
      property_city: params[:property_city],
      loan_officer_name: params[:loan_officer_name],
      loan_officer_email: params[:loan_officer_email],
      loan_officer_phone: params[:loan_officer_phone],#.gsub!(/\D/, ''),
      payment_assistance_program: params[:payment_assistance_program],
      approx_closing_date: params[:approx_closing_date],
      })
      if @homebuying.save
        flash[:success] = "Successfully Completed Hombuying Application"
        redirect_to "/homebuyings/#{@homebuying.id}"
      else
        flash.now[:warning] = @homebuying.errors.full_messages
        render :new
      end
    end

    def show
      @homebuying = Homebuying.find(params[:id]) if current_user
      @homebuying = current_client.homebuying if current_client
    end

    def edit
      @homebuying = Homebuying.find(params[:id]) if current_user
      @homebuying = current_client.homebuying if current_client
    end

    def update
      @homebuying = Homebuying.find(params[:id]) if current_user
      @homebuying = current_client.homebuying if current_client
      if @homebuying.update(homebuying_params)
        @homebuying.realtor_phone.gsub!(/\D/, '')
        @homebuying.loan_officer_phone.gsub!(/\D/, '')
        @homebuying.save
        flash[:success] = "Homebuying Application Updated"
        redirect_to "/homebuyings/#{@homebuying.id}"
      else
        flash.now[:warning] = @homebuying.errors.full_messages
        render :edit
      end
    end

    def destroy
      @homebuying = Homebuying.find(params[:id]) if current_user
      @homebuying = current_client.homebuying if current_client
      
      if @homebuying.destroy
        flash[:success] = "Homebuying Application Deleted."
        redirect_to "/clients/#{current_client.id}"
      else
        flash.now[:warning] = @homebuying.errors.full_messages
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
