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

  def note_create
    @client = params[:id]
    @user = Note.create({
      description: params[:description],
      user_id: current_user.id,
      client_id: params[:id]
      })

    flash[:success] = ['Note added.']
    redirect_to "/clients/#{@client}"
  end

  def show
    if user_signed_in?
      @client = Client.find(params[:id])
      @client_notes = @client.notes
      
    elsif client_signed_in?
      @client = current_client
    end
  end

  def new
  	@client = Client.new
  end

  def create
    #TODO JM pretty sure that this controller never gets run, just the registrations controller. 12/22/16

    # binding.pry
    # @client = Client.create(
    #   first_name: params[:first_name],
    #   last_name: params[:last_name],
    #   home_phone: params[:home_phone],
    #   cell_phone: params[:cell_phone],
    #   work_phone: params[:work_phone],
    #   address: params[:address],
    #   state: params[:state],
    #   city: params[:city],
    #   zip_code: params[:zip_code],
    #   ward: params[:ward],
    #   sex: params[:sex],
    #   race: params[:race],
    #   ssn: params[:ssn],
    #   preferred_contact_method: params[:preferred_contact_method],
    #   preferred_language: params[:preferred_language],
    #   marital_status: params[:marital_status],
    #   dob: params[:dob],
    #   head_of_household: params[:head_of_household] || false,
    #   num_in_household: params[:num_in_household],
    #   num_of_dependants: params[:num_of_dependants],
    #   education_level: params[:education_level],
    #   estimated_household_income: params[:estimated_household_income],
    #   disability: params[:disability] || false,
    #   union_member: params[:union_member] || false,
    #   military_service_member: params[:military_service_member] || false,
    #   volunteer_interest: params[:volunteer_interest] || false
    # )
    # redirect_to "/clients/#{@client.id}"
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
    binding.pry
    if @client.update({
    first_name: params[:first_name],
    last_name: params[:last_name],
    home_phone: params[:home_phone], 
    cell_phone: params[:cell_phone],
    work_phone: params[:work_phone], 
    address: params[:address], 
    state: params[:state], 
    city: params[:city], 
    zip_code: params[:zip_code],
    ward: params[:ward], 
    sex: params[:sex], 
    race: params[:race],
    ssn: params[:ssn],
    preferred_contact_method: params[:preferred_contact_method],
    preferred_language: params[:preferred_language],
    marital_status: params[:marital_status],
    dob: params[:dob],
    head_of_household: params[:head_of_household] || false,
    num_in_household: params[:num_in_household],
    num_of_dependants: params[:num_of_dependants],
    education_level: params[:education_level],
    estimated_household_income: params[:estimated_household_income],
    disability: params[:disability] || false,
    union_member: params[:union_member] || false,
    military_service_member: params[:military_service_member] || false,
    volunteer_interest: params[:volunteer_interest] || false })
      if user_signed_in?
        flash[:success] = "Client info updated."
        redirect_to "/clients/#{@client.id}"
      elsif client_signed_in?
        flash[:success] = "Your info is updated."
        redirect_to "/clients/#{@client.id}"
      end
    else
      flash[:warning] = @client.errors.full_messages
      render :edit
    end
    binding.pry
  end

  def status
    @client = current_client
    @budget = @client.budget
    @foreclosure = @client.foreclosure
    @homebuying = @client.homebuying
    @rental = @client.rental
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    if current_user.id == @note.user_id
      @note.destroy
      redirect_to "/clients/#{@note.client_id}"
    else
      redirect_to "/clients/#{@note.client_id}"
    end
  end

  def assign
    @employee = User.all
    # @foreclosure = Foreclosure.all
    # @homebuyer = Homebuying.all

    # @case = ProgramEmployee.new({
    #   user_id: current_user.id,
    #   programable_id: params[:programable_id],
    #   programable_type: params[:programable_type]
    #   })
    @client = Client.find(params[:client_id])
    if @client.update(user_id: current_user.id, assign: true)
      flash[:success] = "Employee Assigned"
      redirect_to "/users/#{current_user.id}"   
    else
      flash[:warning] = @client.errors.full_messages
      render :show  
    end
  end

end