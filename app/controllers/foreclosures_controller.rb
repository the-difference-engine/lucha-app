class ForeclosuresController < ApplicationController

  before_action :authenticate!

  respond_to :html, :json, :csv


  def index
    @foreclosures = Foreclosure.all

    respond_to do |format|
      format.html
      format.csv { send_data @foreclosures.to_csv } #untested
      format.xls { send_data @foreclosures.to_csv(col_sep: "\t") } #untested
    end
  end

  def new
    @foreclosure = Foreclosure.new
  end

  def search
    @client = Client.where("first_name LIKE ? OR last_name LIKE ? OR address LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    render :index
  end


  def create
    @id = current_client.id if current_client
    @id = Client.find(params[:id]).id if current_user

    @foreclosure = Foreclosure.new({
      client_id: @id,
      currently_foreclosed: params[:currently_foreclosed],
      originating_lender: params[:originating_lender],
      original_loan_number: params[:original_loan_number],
      servicer: params[:servicer],
      servicer_loan_number: params[:servicer_loan_number],
      monthly_mortgage_payment: params[:monthly_mortgage_payment],
      loan_term: params[:loan_term],
      origination_date: params[:origination_date],
      been_to_court: params[:been_to_court],
      court_case_number: params[:court_case_number],
      working_with_lawyer: params[:working_with_lawyer],
      working_w_agency: params[:working_w_agency],
      agency: params[:agency]
      })
    if @foreclosure.save
      flash[:success] = ["You've Completed Your Foreclosure Application"]
      redirect_to "/foreclosures/#{@foreclosure.id}"
    else
      flash.now[:danger] = @foreclosure.errors.full_messages
      render :new
    end
  end

  def show
    @foreclosure = Foreclosure.find(params[:id]) if current_user
    @foreclosure = current_client.foreclosure if current_client
  end

  def edit
    @foreclosure = current_client.foreclosure if current_client
    @foreclosure = Foreclosure.find(params[:id]) if current_user
  end


  def update
    @foreclosure = Foreclosure.find(params[:id]) if current_user
    @foreclosure = current_client.foreclosure if current_client

    if @foreclosure.update(foreclosure_params)
      flash[:success] = ["Foreclosure application updated."]
      redirect_to "/foreclosures/#{@foreclosure.id}"
    else
      flash.now[:warning] = @foreclosure.errors.full_messages
      render :edit
    end
  end

  def destroy
    @foreclosure = Foreclosure.find(params[:id]) if current_user
    @foreclosure = current_client.foreclosure if current_client

    if @foreclosure.destroy
      flash[:success] = ["Foreclosure Application Deleted."]
      redirect_to "/clients/#{current_client.id}"
    else
      flash.now[:warning] = "Error deleting application."
      render :show
    end
  end

private

  def foreclosure_params
    params.permit(
      :currently_foreclosed,
      :originating_lender,
      :original_loan_number,
      :servicer,
      :servicer_loan_number,
      :monthly_mortgage_payment,
      :loan_term,
      :origination_date,
      :been_to_court,
      :court_case_number,
      :working_with_lawyer,
      :working_w_agency,
      :agency,
      :reason_for_default
      )
  end


end
