class ClientsController < ApplicationController
  before_action :authenticate!, :only => [:index, :show, :update, :edit,]
  before_action :authenticate_user!, :only => [:destroy,]
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
    # TODO where is this used? I wrote test but not sure where the view code is
    ## I wonder what the expectation is for 'notes'. can both a user and a client have notes? is this method in the right place? the way I read this code..... ok did some digging. this method is SO IN THE WRONG PLACE makes it really hard to test. this is for a user to make notes on a clients file....
    # notes/1/edit => for edit
    # clients/1 => is the route for making new notes
    # you will have to modify both views
    @client = params[:id]
    params["note"]["user_id"] = current_user.id
    note = Note.new(note_params)
    if note.save!
      flash[:success] = ['Note added.']
      redirect_to client_path(@client)
    else
      render 'note_create'
    end
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



  def edit
    @client = Client.find(params[:id])
    if client_signed_in?
      @client = current_client
    end
  end

  def update
 ## I am not sure why, in this action, there is an update for both user and client, I can not find anything that has to do with user update...
    if user_signed_in?
      @client = Client.find(params[:id])
    elsif client_signed_in?
      @client = current_client
    end
    @client.update(client_params)
    # if @client.update(client_params)
    #   if user_signed_in?
    #     flash[:success] = [ "Client info updated." ]
    #     redirect_to client_path(@client)
    #   elsif client_signed_in?
    #     flash[:success] = [ "Your info is updated." ]
        redirect_to client_path(@client)
    #   end
    # else
    #   flash[:warning] = @client.errors.full_messages
    #   render :edit
    # end
# TODO in the models make the true/false a default value, no need to do this or statement
  end

  def status
    @client = current_client
    @budget = @client.budget
    @foreclosure = @client.foreclosure
    @homebuying = @client.homebuying
    @rental = @client.rental
  end

  def destroy
    note = Note.find_by(id: params[:id])
    if current_user.id == note.user_id
      if note.destroy
        flash[:success] = [ "Note deleted." ]
        redirect_to client_path(note.client_id)
      else
        flash[:error] = [ "Something went wrong note not deleted." ]
        redirect_to client_path(note.client_id)
      end
    else
      redirect_to client_path(note.client_id)
    end
  end

  def assign
    ## I wrote this test assuming that the user is the one to assign a client to a user
 ## I can't find where this is called, however this is something we need, again I don't think this is the right place for this. a client should be passed in and the two attributes updated, why @employee is set?? have no idea...
## See my note in the clients_controller_spec.rb

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
    client = Client.find(params[:id])
  end

  private

  def note_params
    params.require(:note).permit(:description, :user_id, :client_id)
  end

  def client_params
    params.require(:client).permit(
                                    :first_name,
                                    :last_name,
                                    :home_phone,
                                    :cell_phone,
                                    :work_phone,
                                    :address,
                                    :state,
                                    :city,
                                    :zip_code,
                                    :ward,
                                    :sex,
                                    :race,
                                    :ssn,
                                    :preferred_contact_method,
                                    :preferred_language,
                                    :marital_status,
                                    :dob,
                                    :head_of_household,
                                    :num_in_household,
                                    :num_of_dependants,
                                    :education_level,
                                    :estimated_household_income,
                                    :disability,
                                    :union_member,
                                    :military_service_member,
                                    :volunteer_interest
                                  )
  end

end
