class ClientsController < ApplicationController
  include FormInputsHelper

  before_action :authenticate!, :only => [:index, :show, :update, :edit,]
  before_action :verify_user!, :only => [:destroy,]

  def index
    @users = User.all
    @clients = Client.all
    @foreclosures = Foreclosure.all

    respond_to do |format|
      format.json
      format.html
      format.csv { send_data @clients.to_csv, type: 'text/csv', filename: "all_clients-#{Date.today}.csv"}
      format.xls { send_data @clients.to_csv, filename: "all_clients-#{Date.today}.xls"}
    end

  end

  def note_create
    # TODO where is this used? I wrote test but not sure where the view code is
    ## I wonder what the expectation is for 'notes'. can both a user and a client have notes? is this method in the right place? the way I read this code..... ok did some digging. this method is SO IN THE WRONG PLACE makes it really hard to test. this is for a user to make notes on a clients file....
    # notes/1/edit => for edit
    # clients/1 => is the route for making new notes
    # you will have to modify both views
    @client = Client.find(params[:id])
    note = Note.create(user_id: current_user.id, client_id: @client.id, description: params[:description])
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

    respond_to do |format|
      format.html
      format.pdf do
        html = render_to_string(:action => :show, :template => "clients/pdfshow.html.erb", :layout => "pdf.html.erb") 
        pdf = WickedPdf.new.pdf_from_string(html) 

        send_data(pdf, 
          :filename => "#{@client.full_name_pdf}.pdf", 
          :disposition => 'attachment')
      end
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
    if user_signed_in?
      @client = Client.find(params[:id])
    elsif client_signed_in?
      @client = current_client
    end
    if @client.update({
      first_name: params[:client][:first_name],
      last_name: params[:client][:last_name],
      home_phone: params[:client][:home_phone],
      cell_phone: params[:client][:cell_phone],
      work_phone: params[:client][:work_phone],
      address: params[:client][:address],
      state: params[:client][:state],
      city: params[:client][:city],
      zip_code: params[:client][:zip_code],
      ward: params[:client][:ward],
      sex: params[:client][:sex],
      race: params[:client][:race],
      ssn: params[:client][:ssn],
      preferred_contact_method: params[:client][:preferred_contact_method],
      preferred_language: params[:client][:preferred_language],
      marital_status: params[:client][:marital_status],
      dob: params[:client][:dob],
      head_of_household: params[:client][:head_of_household],
      num_in_household: params[:client][:num_in_household],
      num_of_dependants: params[:client][:num_of_dependants],
      education_level: params[:client][:education_level],
      estimated_household_income: params[:client][:estimated_household_income],
      disability: params[:client][:disability],
      union_member: params[:client][:union_member],
      military_service_member: params[:client][:military_service_member],
      volunteer_interest: params[:client][:volunteer_interest],
      user_id: params[:client][:user_id]})
      flash[:success] = [ "Profile Updated." ]
      redirect_to client_path(@client)
    else
      flash.now[:warning] = @client.errors.full_messages
      render :edit
    end
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
        flash[:danger] = [ "Something went wrong note not deleted." ]
        redirect_to client_path(note.client_id)
      end
    else
      redirect_to client_path(note.client_id)
    end
  end

  def assign
    client = Client.find(params[:id])
    user_id = params[:client][:user_id]
    if user_id && client.update(user_id: user_id)
      flash[:success] = [ 'Client assigned successfully!' ]
    else
      flash[:danger] = [ 'Something has gone wrong.']
    end
    redirect_to "/users"
  end

  def unassign
    client = Client.find(params[:id])
    if client.update(user_id: nil)
      flash[:success] = [ 'Client unassigned successfully' ]
    else
      flash[:danger] = [ 'Something has gone wrong' ]
    end
    redirect_to "/users/#{current_user.id}"
  end

  private

  def note_params
    params.require(:note).permit(:description, :user_id, :client_id)
  end

  def client_params
    params.permit(
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
      :volunteer_interest,
      :user_id
    )
  end

end
