class UsersController < Devise::RegistrationsController
  # before_action :authenticate_employee!, except: [:new]

  def index
    @clients = Client.unassigned_client
  end

  def show
    @user = User.find(params[:id])
    ## this didn't work for me. I had to change this. current_user was nil
    # @clients = Client.where(user_id: current_user.id)
    @clients = Client.where(user_id: @user.id)
  end

  def new
    @user = User.new
    render :new
  end

  def create
   @user = User.new({
      first_name: params[:user][:first_name], 
      last_name: params[:user][:last_name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],      
      home_phone: params[:user][:home_phone], 
      work_phone: params[:user][:work_phone], 
      cell_phone: params[:user][:cell_phone]
      })
    if @user.save
      flash[:success] = "The account has been created"
      redirect_to "/users/#{@user.id}"
    else
      render :new
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @client.update({first: params[:name],
      first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      home_phone: params[:home_phone], 
      work_phone: params[:work_phone], 
      cell_phone: params[:cell_phone]
        })

    flash[:success] = "You're info is updated."
    redirect_to "/clients/#{@client.id}"
    else
      render :edit
    end
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def search
    @client = Client.where("first_name LIKE ? OR last_name LIKE ? OR address LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    render :index
  end

  def destroy
  	
  end
end
