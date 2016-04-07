class ClientsController < ApplicationController
  before_action :authenticate_current_client!, :only => [:index, :show, :edit, :update, :destroy]
  respond_to :html, :json

	def index
    @employee = User.all
    @clients = Client.all
    @foreclosures = Foreclosure.all
    
    respond_to do |format|
      format.json
      format.html
      format.csv { send_data @clients.to_csv }
      format.xls  { send_data @clients.to_csv(col_sep: "\t") }
    end

  end

  def show
    if user_signed_in?
      @client = Client.find(params[:id])
    elsif client_signed_in?
      @client = current_client
    end
    @client
  end

  def new
  	@client = Client.new
  end

  def edit
    @client = Client.find(params[:id].to_i)
    if client_signed_in?
      @client = current_client
    end
  end

  def update

    if user_signed_in?
      @client = Client.find(params[:id])
    elsif client_signed_in?
      @client = current_client
    end

    # This works with the Best_in_Place gem. Updates the object using an HTTP PUT call.
    @client.update_attributes(client_params)
    respond_with @client


    # This is how I handled the updating before the Best_in_Place gem
    # @client.update({
    # first_name: params[:first_name],
    # last_name: params[:last_name],
    # email: params[:email],
    # password: params[:password],
    # race: params[:race],
    # sex: params[:sex], 
    # home_phone: params[:home_phone], 
    # work_phone: params[:work_phone], 
    # cell_phone: params[:cell_phone], 
    # address: params[:address], 
    # state: params[:state], 
    # city: params[:city], 
    # zip_code: params[:zip_code],
    # ward: params[:ward],
    # ssn: params[:ssn],
    # preferred_contact_method: params[:preferred_contact_method],
    # preferred_language: params[:preferred_language],
    # dob: params[:dob],
    # head_of_household: params[:head_of_household],
    # num_in_household: params[:num_in_household],
    # num_of_dependants: params[:num_of_dependants],
    # education_level: params[:education_level],
    # disability: params[:disability],
    # union_member: params[:union_member],
    # military_service_member: params[:military_service_member],
    # volunteer_interest: params[:volunteer_interest],
    # estimated_household_income: params[:estimated_household_income],
    # authorization_and_waiver: params[:authorization_and_waiver],
    # privacy_policy_authorization: params[:privacy_policy_authorization]
    #   })
    



    # if user_signed_in?
    # flash[:success] = "Client info updated."
    # redirect_to "/clients/#{@client.id}"
    # elsif client_signed_in?
    # flash[:success] = "You're info is updated."
    # redirect_to "/clients/#{@client.id}/status"
    # end

  end

  def status
    @client = current_client
    @budget = @client.budget
    @foreclosure = @client.foreclosure
    @homebuying = @client.homebuying
    @rental = @client.rental
  end

  def destroy
  end

end