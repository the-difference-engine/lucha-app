class ClientsController < ApplicationController  
	def index
  
  end

  def show
    @client = Client.find(params[:id])

  end

  def new
  	
  end

  def create
  	
  end

  def edit
  	
  end

  def update
    # @client = Client.find(params[:id])
    # if @client.update({first_name: params[:first_name], 
    #   last_name: params[:last_name],
    #   race: params[:race],
    #   sex: params[:sex], 
    #   home_phone: params[:home_phone], 
    #   work_phone: params[:work_phone], 
    #   cell_phone: params[:cell_phone], 
    #   address: params[:address], 
    #   state: params[:state], 
    #   city: params[:city], 
    #   zip_code: params[:zip_code]
    #     })

    # flash[:success] = "You're info is updated."
    # redirect_to "/clients/#{@client.id}"
    # else
    #   render :edit
    # end

  end

  def destroy
  	
  end
end
