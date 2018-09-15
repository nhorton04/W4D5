require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'fiery_swagger'
      fill_in 'password', with: 'swordfish'
      click_on 'Submit'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'fiery_swagger'
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    dummy = User.new(username: "fiery_swagger", password: "swordfish")
      visit new_session_url
    fill_in 'username', with: 'fiery_swagger'
    fill_in 'password', with: 'swordfish'
    click_on 'Submit'
    visit user_url(dummy.id)
    expect(page).to have_content 'fiery_swagger'
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_user_url
    expect(page).to have_content 'login'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    expect(page).to_not have_content 'fiery_swagger'
  end
end
