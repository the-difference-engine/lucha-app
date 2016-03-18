class LawProjectsController < ApplicationController
	skip_before_action :authenticate_client!


	def index
    @law_project = LawProject.where(client_id: params[:id])	
	end

	def new
		@law_project = LawProject.new
	end


	def create
    # if client_signed_in?
	    @law_project = LawProject.new({
	    	client_id: params[:id],
	     violation_type: params[:violation_type], 
				current_evicted: params[:current_evicted],
				community_group: params[:community_group],
				tech_assistance: params[:tech_assistance],
				frclsr_prevention: params[:frclsr_prevention],
				low_income_family: params[:low_income_family],
				displacement: params[:displacement],
				substandard_housing: params[:substandard_housing],
				disabilities: params[:disabilities],
				lucha_tenant: params[:lucha_tenant],
				law_project_chargable: params[:law_project_chargable],
				other: params[:other],
				census_tract: params[:census_tract]

	    	 })
	    if @law_project.save
	    flash[:success] = "You've completed the law_project application"
	    redirect_to "/clients/#{@law_project.client_id}"
	    else
	      render :create
	    end

	  # elsif user_signed_in?
	  #   @law_project = LawProject.new({violation_type: params[:violation_type], client_id: paramms[:client_id] })
	  #   if @law_project.save
	  #   flash[:success] = "You've completed the law_project application"
	  #   redirect_to "/clients/#{@law_project.client_id}"
	  #   else
	  #     render :create
	  #   end
	  # end
  end
	

	def edit
    @law_project = LawProject.where(client_id: params[:id])
	end

	def update
		@law_project = LawProject.where(client_id: params[:id])
		@law_project.update(
			violation_type: params[:violation_type], 
			current_evicted: params[:current_evicted],
			community_group: params[:community_group],
			tech_assistance: params[:tech_assistance],
			frclsr_prevention: params[:frclsr_prevention],
			low_income_family: params[:low_income_family],
			displacement: params[:displacement],
			substandard_housing: params[:substandard_housing],
			disabilities: params[:disabilities],
			lucha_tenant: params[:lucha_tenant],
			law_project_chargable: params[:law_project_chargable],
			other: params[:other],
			census_tract: params[:census_tract]
    )
		if
			flash[:success] = "law_project application submitted."
			redirect_to '/clients/#{@law_project.client_id}'
		else
			render :edit
		end
	end

	def show
		@law_project = LawProject.where(client_id: params[:id])
	end

end
