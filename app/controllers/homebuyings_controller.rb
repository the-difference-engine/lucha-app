class HomebuyingsController < ApplicationController
	skip_before_action :authenticate_client!
  respond_to :html, :json

	def index
    @homebuyings = Homebuying.all	
	end

	def new
		@homebuying = Homebuying.new	
	end


	def create
		if current_client
			@id = current_client.id
		elsif current_user
			@id = Client.find(params[:id]).id
		end
		@id
			
	  @homebuying = Homebuying.new(
	  	{client_id: @id,
	  		  	lender: params[:lender], 
	  		  	hear_of_workshop: params[:hear_of_workshop],
	  				contact_for_appointment: params[:contact_for_appointment],
	  				real_estate_contract: params[:real_estate_contract],
	  				realtor_name: params[:realtor_name],
	  				realtor_phone: params[:realtor_phone],
	  				property_address: params[:property_address],
	  				property_state: params[:property_state],
	  				property_city: params[:property_city],
	  				loan_officer_name: params[:loan_officer_name],
	  				loan_officer_email: params[:loan_officer_email],
	  				loan_officer_phone: params[:loan_officer_phone],
	  				payment_assistance_program: params[:payment_assistance_program],
	  				approx_closing_date: params[:approx_closing_date]}
	  	)
	  
    
    if @homebuying.save
    	ProgramEmployee.create({programable_id: @homebuying.id, programable_type: "Homebuying"})

	    flash[:success] = ["You've completed the homebuying application"]
	    redirect_to "/clients/#{@homebuying.client_id}/status"
    else
      flash[:danger] = @homebuying.errors.full_messages
      render :new
    end
  end
	

	def edit
		if client_signed_in?
			@homebuying = current_client.homebuying
    elsif user_signed_in?
      @forelosure = Homebuying.find(params[:id])
    end
    @homebuying	
  end

	def update

    if current_client
      @homebuying = current_client.homebuying
    elsif current_user
      @homebuying = Homebuying.find(params[:id])
    end

    @homebuying.update_attributes(homebuying_params)
    respond_with @homebuying

		# @client = current_client
		# @homebuying = Homebuying.where(client_id: homebuying.client.id)
		# if @homebuying.update(
	 #    	lender: params[:lender], 
	 #    	hear_of_workshop: params[:hear_of_workshop],
		# 		contact_for_appointment: params[:contact_for_appointment],
		# 		real_estate_contract: params[:real_estate_contract],
		# 		realtor_name: params[:realtor_name],
		# 		realtor_phone: params[:realtor_phone],
		# 		property_address: params[:property_address],
		# 		property_state: params[:property_state],
		# 		property_city: params[:property_city],
		# 		loan_officer_name: params[:loan_officer_name],
		# 		loan_officer_email: params[:loan_officer_email],
		# 		loan_officer_phone: params[:loan_officer_phone],
		# 		payment_assistance_program: params[:payment_assistance_program],
		# 		approx_closing_date: params[:approx_closing_date]
  #       )
		# 	flash[:success] = "homebuying application submitted."
		# 	redirect_to '/clients/#{@homebuying.client_id}'
		# else
		# 	render :edit
		# end
	end

	def show
		@homebuying = Homebuying.find(params[:id])
	end

	def destroy
		
		@homebuying = Homebuying.find(params[:id])
		@homebuying.destroy
		flash[:danger] = "Homebuying application deleted."
		redirect_to "/clients/#{params[:id]}/status"
	end

	private

  def homebuying_params
    params.require(:homebuying).permit(
      :lender,
			:hear_of_workshop,
			:contact_for_appointment,
			:real_estate_contract,
			:realtor_name,
			:realtor_phone,
			:property_address,
			:property_state,
			:property_city,
			:loan_officer_name,
			:loan_officer_email,
			:loan_officer_phone,
			:payment_assistance_program,
			:approx_closing_date
		)
  end
end
