class ClientsController < ApplicationController  

  before_action :authenticate_user!

	def index
    if user_signed_in?
      @client = Client.all
    elsif client_signed_in?
      @client = current_client
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
      email: params[:email],
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
          render :create
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
        redirect_to "/clients"
      else
        render :create
    end
  end

  def edit
    if user_signed_in?
      @client = Client.find(params[:id])
    elsif client_signed_in?
      @client = current_client.id
    end
  end

  def update
   
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
    redirect_to "/clients/#{@client.id}"
    else
      render :edit
    end
  end

  def destroy
  end

end
end