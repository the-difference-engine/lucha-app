class ClientsController < ApplicationController  
  before_action :authenticate_current_client!, :only => [:show, :edit, :update, :destroy]

	def index
    @employee = User.all

    if user_signed_in?
      @clients = Client.all
    elsif client_signed_in?
      @client = current_client
    end
    @client
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
      ward: params[:ward]
        })

        if @client.save

          flash[:success] = "The account has been created"
          redirect_to "/clients/#{@client.id}"
        else
          render :show
        end
  
    elsif client_signed_in?
    @client = Client.new({first_name: params[:first_name], 
      last_name: params[:last_name],
      race: params[:race],
      sex: params[:sex], 
      email: params[:email],
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone], 
      address: params[:address], 
      state: params[:state], 
      city: params[:city], 
      zip_code: params[:zip_code]
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
    @client = Client.find(params[:id])
    if user_signed_in?
      @client = Client.find(params[:id])

      @client.update({first_name: params[:first_name],
      last_name: params[:last_name],
      race: params[:race],
      sex: params[:sex], 
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone], 
      address: params[:address], 
      state: params[:state], 
      city: params[:city], 
      zip_code: params[:zip_code]
        })
      flash[:success] = "You're info is updated."
      redirect_to "/clients/#{@client.id}"


    elsif client_signed_in?
      @client = current_client
      if @client.update({first_name: params[:first_name],
        last_name: params[:last_name],
        race: params[:race],
        sex: params[:sex], 
        home_phone: params[:home_phone], 
        work_phone: params[:work_phone], 
        cell_phone: params[:cell_phone], 
        address: params[:address], 
        state: params[:state], 
        city: params[:city], 
        zip_code: params[:zip_code]
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