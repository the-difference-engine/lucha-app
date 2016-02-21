class LawProjectsController < ApplicationController
	def index
    @law_project = LawProject.where(client_id: params[:id])	
	end

	def new
		@law_project = LawProject.new
	end


	def create
    if client_signed_in?
	    @law_project = LawProject.new({violation_type: params[:violation_type], client_id: current_client.id })
	    if @law_project.save
	    flash[:success] = "You've completed the law_project application"
	    redirect_to "/clients/#{@law_project.client_id}"
	    else
	      render :create
	    end

	  elsif user_signed_in?
	    @law_project = LawProject.new({violation_type: params[:violation_type], client_id: paramms[:client_id] })
	    if @law_project.save
	    flash[:success] = "You've completed the law_project application"
	    redirect_to "/clients/#{@law_project.client_id}"
	    else
	      render :create
	    end
	  end
  end
	

	def edit
    @law_project = LawProject.where(client_id: params[:id])
	end

	def update
		@law_project = LawProject.where(client_id: params[:id])
		if @law_project.update({violation_type: params[:violation_type], 
        })
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
