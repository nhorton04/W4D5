require 'rails_helper'

RSpec.describe UsersController, type: :controller do


 describe 'GET #new' do
   it "Renders the new user page" do
     get :new
     expect(response).to render_template('new')
   end
 end

  describe 'GET #show' do
    subject(:user) {User.create(username: "Itsafake", password: "sapsword") }
    it "Renders the show page of an existing user." do
      # debugger
      get :show, params: {id: user.id}
      expect(response).to render_template('show')
    end
 end

 describe 'GET #index' do
    it "Shows the user's index page" do
      get :index
      expect(response).to render_template('index')
    end
 end

end
