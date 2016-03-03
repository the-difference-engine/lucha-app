class LandingPagesController < ApplicationController
	before_action :authenticate_user!
	# skip_before_action :authenticate_client!
	# skip_before_action :authenticate_employee!

  def index
  	@clients = Client.all
  	render :index, layout: false
  end




end
