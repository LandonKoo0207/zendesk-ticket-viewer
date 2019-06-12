require 'rails_helper'

RSpec.feature 'Handle basic errors' do
  context 'Try to load an individual ticket that does not exist' do
    scenario 'Not Found error page is loaded for non-existing ticket 202' do
      visit '/tickets/202'
      expect(page).to have_content("Oops! Something's not right...")
      expect(page).to have_content("Not Found")
      expect(page).to have_content("The URL of the API appears to be invalid.")
    end
  end

  context 'Try to access the API with wrong authentication details' do
    scenario 'Authentication Error page is loaded when wrong username was used' do
      Flexirest::Base.username = 'hey'
      visit root_path
      expect(page).to have_content("Oops! Something's not right...")
      expect(page).to have_content("Authentication Error")
    end

    scenario 'Authentication Error page is loaded when wrong password was used' do
      Flexirest::Base.password = '1234'
      visit root_path
      expect(page).to have_content("Oops! Something's not right...")
      expect(page).to have_content("Authentication Error")
    end
  end
end