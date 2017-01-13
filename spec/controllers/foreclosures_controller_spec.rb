require 'rails_helper'
require 'spec_helper'

RSpec.describe ForeclosuresController, type: :controller do
  include Devise::TestHelpers

  describe "GET/index" do

    it "renders the :index template" do
      login_user
      foreclosure = create(:foreclosure)
      get :index
      expect(response).to render_template :index
      expect(response.header['Content-Type']).to eq('text/html; charset=utf-8')
    end

    it "renders csv" do
      login_user
      foreclosure = create(:foreclosure)
      get :index, format: :csv
      expect(response.header['Content-Type']).to match 'text/csv'
    end

  end
    # before :each do
    #   get :index, format: :csv
    # end

    # it "generate CSV" do
    #   expect(response.header['Content-Type']).to eq('text/csv')
    # end

end
