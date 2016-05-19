class ProgramEmployeesController < ApplicationController
	
	def create
		@employee = User.all
		# @foreclosure = Foreclosure.all
		# @homebuyer = Homebuying.all

		# @case = ProgramEmployee.new({
		# 	user_id: current_user.id,
		# 	programable_id: params[:programable_id],
		# 	programable_type: params[:programable_type]
		# 	})
    @client = Client.find(params[:client_id])
    if @client.update(user_id: current_user.id)
		  flash[:success] = "Employee Assigned"
			redirect_to "/users/#{current_user.id}"		
		else
		  render :clients
		end
	end

	def show
		@order = ProgramEmployee.find(params[:id])
	end

end
