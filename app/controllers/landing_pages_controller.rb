class LandingPagesController < ApplicationController
	skip_before_action :authenticate_client!
	skip_before_action :authenticate_employee!

  def index
  	@clients = Client.all
  	render :index, layout: false
  end

  def TOA_en
    render :TOA_en, layout: false
  end

  def TOA_es
    render :TOA_es, layout: false
  end

end
