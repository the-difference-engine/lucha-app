class ClientsController < ApplicationController  
  before_action :authenticate_current_client!, :only => [:show, :edit, :update, :destroy]

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
  end

  def new
  	
  end

  def create
    if user_signed_in?
      @client = Client.new({
      first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      race: params[:race],
      sex: params[:sex], 
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone], 
      address: params[:address], 
      state: params[:state], 
      city: params[:city], 
      zip_code: params[:zip_code],
      ward: params[:ward],
      zip_code: params[:zip_code],
      ssn: params[:ssn],
      preferred_contact_method: params[:preferred_contact_method],
      preferred_language: params[:preferred_language],
      dob: params[:dob],
      head_of_household: params[:head_of_household],
      num_in_household: params[:num_in_household],
      num_of_dependants: params[:num_of_dependants],
      education_level: params[:education_level],
      disability: params[:disability],
      union_member: params[:union_member],
      military_service_member: params[:military_service_member],
      volunteer_interest: params[:volunteer_interest],
      estimated_household_income: params[:estimated_household_income],
      authorization_and_waiver: params[:authorization_and_waiver],
      privacy_policy_authorization: params[:privacy_policy_authorization]
        })

        if @client.save

          flash[:success] = "The account has been created"
          redirect_to "/clients/#{@client.id}"
        else
          render :create
        end
  
    elsif client_signed_in?
    @client = Client.new({first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      race: params[:race],
      sex: params[:sex], 
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone], 
      address: params[:address], 
      state: params[:state], 
      city: params[:city], 
      zip_code: params[:zip_code],
      ward: params[:ward],
      zip_code: params[:zip_code],
      ssn: params[:ssn],
      preferred_contact_method: params[:preferred_contact_method],
      preferred_language: params[:preferred_language],
      dob: params[:dob],
      head_of_household: params[:head_of_household],
      num_in_household: params[:num_in_household],
      num_of_dependants: params[:num_of_dependants],
      education_level: params[:education_level],
      disability: params[:disability],
      union_member: params[:union_member],
      military_service_member: params[:military_service_member],
      volunteer_interest: params[:volunteer_interest],
      estimated_household_income: params[:estimated_household_income],
      authorization_and_waiver: params[:authorization_and_waiver],
      privacy_policy_authorization: params[:privacy_policy_authorization]
        })

      if @client.save

        flash[:success] = "You're account has been created"
        redirect_to :show
      else
        render :create
      end
    end
  end

  def edit
    @client = Client.find(params[:id])
    if client_signed_in?
      @client = current_client
    end
  end

  # def application_program_types
  #   program_array = []
  #   client_applications.each do |program|
  #     ProgramEmployees.create(programable_id: program.id, programable_type: program.class)
  #   end
  #   program_array
  # end

  def update
    if user_signed_in?
      @client = Client.find(params[:id])

      @client.update({first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      race: params[:race],
      sex: params[:sex], 
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone], 
      address: params[:address], 
      state: params[:state], 
      city: params[:city], 
      zip_code: params[:zip_code],
      ward: params[:ward],
      zip_code: params[:zip_code],
      ssn: params[:ssn],
      preferred_contact_method: params[:preferred_contact_method],
      preferred_language: params[:preferred_language],
      dob: params[:dob],
      head_of_household: params[:head_of_household],
      num_in_household: params[:num_in_household],
      num_of_dependants: params[:num_of_dependants],
      education_level: params[:education_level],
      disability: params[:disability],
      union_member: params[:union_member],
      military_service_member: params[:military_service_member],
      volunteer_interest: params[:volunteer_interest],
      estimated_household_income: params[:estimated_household_income],
      authorization_and_waiver: params[:authorization_and_waiver],
      privacy_policy_authorization: params[:privacy_policy_authorization]
        })
      flash[:success] = "You're info is updated."
      redirect_to "/clients/#{@client.id}"


    elsif client_signed_in?
      @client = current_client
      if @client.update({first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      race: params[:race],
      sex: params[:sex], 
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone], 
      address: params[:address], 
      state: params[:state], 
      city: params[:city], 
      zip_code: params[:zip_code],
      ward: params[:ward],
      zip_code: params[:zip_code],
      ssn: params[:ssn],
      preferred_contact_method: params[:preferred_contact_method],
      preferred_language: params[:preferred_language],
      dob: params[:dob],
      head_of_household: params[:head_of_household],
      num_in_household: params[:num_in_household],
      num_of_dependants: params[:num_of_dependants],
      education_level: params[:education_level],
      disability: params[:disability],
      union_member: params[:union_member],
      military_service_member: params[:military_service_member],
      volunteer_interest: params[:volunteer_interest],
      estimated_household_income: params[:estimated_household_income],
      authorization_and_waiver: params[:authorization_and_waiver],
      privacy_policy_authorization: params[:privacy_policy_authorization]
          })

      flash[:success] = "You're info is updated."
      redirect_to "/clients/#{@client.id}/status"
      else
        render :edit
      end
    end
  end

  def destroy
  end


end