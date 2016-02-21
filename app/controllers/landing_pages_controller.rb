class LandingPagesController < ApplicationController
	skip_before_action :authenticate_client!
	skip_before_action :authenticate_employee!

  def index
  	@clients = Client.all
  end

end
