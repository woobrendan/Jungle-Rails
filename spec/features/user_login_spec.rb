require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(first_name: "Matt", last_name: "Campbell", email: "matt@porsche.com", password: "test", password_confirmation: "test")
  end


  scenario "Users can login and redirect to homepage" do

    visit root_path
    expect(page).not_to have_link 'Logout'
    click_link "Login"
    
    fill_in "email", with: "Matt@porsche.com"
    fill_in "password", with: "test"
    click_button "Submit"
  
    expect(page).to have_link 'Logout'

  end
end
