class ForeclosuresController < ApplicationController
	skip_before_action :authenticate_client!
	
	def index
    @foreclosures = Foreclosure.all	
    respond_to do |format|
	    format.html
	    format.csv { send_data @foreclosures.to_csv }
	    format.xls  { send_data @foreclosures.to_csv(col_sep: "\t") }
	  end
	end

	def new
		@foreclosure = Foreclosure.new
	end

	def search
		@client = Client.where("first_name LIKE ? OR last_name LIKE ? OR address LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
		render :index
	end


	def create
    if client_signed_in?
	    @foreclosure = Foreclosure.new({ 
	    	client_id: current_client.id,
	    	currently_foreclosed: params[:currently_foreclosed],
				originating_lender: params[:originating_lender],
				original_loan_number: params[:original_loan_number],
				servicer: params[:servicer], 
				servicer_loan_number: params[:servicer_loan_number],
				monthly_mortgage_payment: params[:monthly_mortgage_payment],
				loan_term: params[:loan_term], 
				origination_date: params[:origination_date], 
				been_to_court: params[:been_to_court], 
				court_case_number: params[:court_case_number] , 
				working_with_lawyer: params[:working_with_lawyer],
				working_w_agency: params[:working_w_agency], 
				agency: params[:agency]
	     })

	    if @foreclosure.save
	    flash[:success] = "You've completed the foreclosure application"
	    redirect_to "/clients/#{@foreclosure.client_id}"
	    else
	      render :create
	    end

	  elsif user_signed_in?
	    @foreclosure = Foreclosure.new({client_id: paramms[:client_id], 
	    	currently_foreclosed: params[:currently_foreclosed],
				originating_lender: params[:originating_lender],
				original_loan_number: params[:original_loan_number],
				servicer: params[:servicer], 
				servicer_loan_number: params[:servicer_loan_number],
				monthly_mortgage_payment: params[:monthly_mortgage_payment],
				loan_term: params[:loan_term], 
				origination_date: params[:origination_date], 
				been_to_court: params[:been_to_court], 
				court_case_number: params[:court_case_number] , 
				working_with_lawyer: params[:working_with_lawyer],
				working_w_agency: params[:working_w_agency], 
				agency: params[:agency]
	    	})
	    @program = Program_employee.new({
	    	user_id: params[:user_id], programable_id: params[:programable_id], programable_type: params[:programable_type]
	    	})
	    if @foreclosure.save && @program.save
	    flash[:success] = "You've completed the foreclosure application"
	    redirect_to "/clients/#{@foreclosure.client_id}"
	    else
	      render :create
	    end
	  end
  end
	

	def edit
    @foreclosure = Foreclosure.where(client_id: params[:id])
    # @foreclosure = foreclosure[0]
	end

	def update
		@foreclosure = Foreclosure.where(client_id: params[:id])
		if @foreclosure.update({currently_foreclosed: params[:currently_foreclosed], 
        })
			flash[:success] = "Foreclosure application submitted."
			redirect_to '/clients/#{@foreclosure.client_id}'
		else
			render :edit
		end
	end

	def show
		@foreclosure = Foreclosure.where(client_id: params[:id])
	end

end
