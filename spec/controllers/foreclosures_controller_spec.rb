require 'rails_helper'
require 'spec_helper'

RSpec.describe ForeclosuresController, type: :controller do
  include Devise::TestHelpers


  describe "GET/index" do

    it "renders the :index template" do
      #test for current user
      #test for user.forclosure
      login_user

      client = create(:client)

      get :index
      expect(response).to render_template :index
    end

  end
    # before :each do
    #   get :index, format: :csv
    # end

    # it "generate CSV" do
    #   expect(response.header['Content-Type']).to eq('text/csv')
    # end

end
