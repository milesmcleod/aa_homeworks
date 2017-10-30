require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  feature "the signup process" do

    scenario "has a new user page" do
      visit new_user_url
      expect(page).to have_content "Sign Up"
    end

    feature "signing up a user" do
      before(:each) do
        visit '/users/new'
        fill_in 'email:', :with => "testing@email.com"
        fill_in 'password:', :with => "password"
        click_on "Sign Up!"
      end

      scenario "redirects to purgatory_url after signup" do
        expect(page).to have_content 'CHECK UR EMAIL AND THEN U CAN LOGIN USING THAT LINK'
      end
    end

    feature "with an invalid user" do
      before(:each) do
        visit '/users/new'
        fill_in 'email:', :with => "testing@email.com"
        click_on "Sign Up!"
      end

      scenario "re-renders the signup page after failed signup" do
        expect(page).to have_content "Sign Up!"
      end
    end

  end

end
