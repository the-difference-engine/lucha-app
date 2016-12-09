class ForeclosuresController < ApplicationController
  # skip_before_action :authenticate_client!
  respond_to :html, :json, :csv

  def index
    if current_user
      @foreclosures = current_user.clients.foreclosures
      respond_to do |format|
        format.html
        format.csv { send_data @foreclosures.to_csv }
        format.xls { send_data @foreclosures.to_csv(col_sep: "\t") }
      end
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
    if client_signed_in?
     @id = current_client.id
    elsif user_signed_in?
     @id = Foreclosure.where(client_id: params[:id]).first.id
    end
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
       flash[:success] = ["You've completed the foreclosure application"]
       redirect_to "/foreclosures/#{@foreclosure.id}"
     else
      flash[:danger] = @foreclosure.errors.full_messages
      render :new
    end
  end

  def show
    @foreclosure = Foreclosure.find(params[:id])
  end


  def edit
    if client_signed_in?
     @foreclosure = current_client.foreclosure
    elsif user_signed_in?
      @forelosure = Foreclosure.find(params[:id])
    end
  end

  def update
    if current_client
      @foreclosure = Foreclosure.find_by(client_id: current_client.id)
    elsif current_user
      @foreclosure = Foreclosure.where(client_id: params[:id])
    end

    @foreclosure = Foreclosure.where(client_id: current_client.id)[0]
    if @foreclosure.update({
      currently_foreclosed: params[:currently_foreclosed],
      originating_lender: params[:originating_lender],
      original_loan_number: params[:original_loan_number],
      servicer: params[:servicer],
      servicer_loan_number: params[:servicer_loan_number],
      monthly_mortgage_payment: params[:monthly_mortgage_payment],
      loan_term: params[:loan_term],
      origination_date: params[:origination_date],
      been_to_court: params[:been_to_court],
      court_case_number: params[:court_case_number] ,
      working_with_lawyer: params[:working_with_lawyer],
      working_w_agency: params[:working_w_agency],
      agency: params[:agency]
      })
    flash[:success] = "Foreclosure application submitted."
    redirect_to '/clients/#{@foreclosure.client_id}'
    else
     render :edit
    end
  end

  def destroy
    @foreclosure = Foreclosure.find(params[:id])
    @foreclosure.destroy
    flash[:danger] = "Foreclosure application deleted."
    redirect_to "/clients/#{params[:id]}/status"
  end

private

  def foreclosure_params
    params.require(:foreclosure).permit(
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
