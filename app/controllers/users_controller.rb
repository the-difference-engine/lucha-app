class UsersController < Devise::RegistrationsController
  before_action :verify_user!, except: [:new, :create, :index]
  before_action :verify_admin!, only: [:index, :toggle_admin]

  def index
    @users = User.all.order('created_at desc')
    # @client = 

    respond_to do |format|
      format.json
      format.html
      format.csv { send_data @users.to_csv, type: 'text/csv' , filename: "all_clients-#{Date.today}.csv"}
      format.xls  
    end
  end

  def show
    if current_user.admin
      @user = params[:id] ? User.find(params[:id]) : User.find(current_user.id)
    else
      @user = User.find(current_user.id)
    end
    ## this didn't work for me. I had to change this. current_user was nil
    # @clients = Client.where(user_id: current_user.id)
    @clients = Client.where(user_id: @user.id).order('created_at desc')

    respond_to do |format|
      format.json
      format.html
      format.csv { send_data @clients.to_csv, type: 'text/csv', filename: "#{@user.full_name}'s clients-#{Date.today}.csv" }
      format.xls { send_data @clients.to_csv(col_sep: "\t"), filename: "#{@user.full_name}'s clients-#{Date.today}.xls"}
    end
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
      cell_phone: params[:user][:cell_phone],
      position: params[:user][:position],
      address: params[:user][:address]
      })
    @user.sanitize_phone
    if @user.save
      sign_in(@user, scope: :user)
      flash[:success] = "The account has been created"
      redirect_to "/users/#{@user.id}"
    else
      flash[:danger] = "The account failed to be created"
      render :new
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update({
      first_name: params[:first_name],
      last_name: params[:last_name],
      home_phone: params[:home_phone].gsub(/\D/, ''),
      work_phone: params[:work_phone].gsub(/\D/, ''),
      cell_phone: params[:cell_phone].gsub(/\D/, ''),
      position: params[:position],
      address: params[:address]
        })

    flash[:success] = "Your info is updated."
    redirect_to "/users/#{@user.id}"
    else
      render :edit
    end
  end

  def toggle_admin
    @user = User.find(params[:id])
    @user.admin = !@user.admin
    if @user.save
      render json: "success"
    else
      render json: "error"
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
