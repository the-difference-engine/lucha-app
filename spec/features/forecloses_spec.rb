require 'rails_helper'

include Devise::TestHelpers

RSpec.feature 'Test foreclose application page', js: true, type: :feature do

  # before(:each) do
  #   @client = create(:client)
  #   sign_in @client
  # end

  it 'visits the #show page' do
    visit "/landing_pages/index"
  end

  # it 'visits homepage, clicks one showing' do
  #   visit(root_path)
  #   within ".showtimes" do
  #     find('input[type=hidden]').set @showing.id
  #     find('input[type="submit"]').click
  #   end
  #   expect(page)
  # end
end
