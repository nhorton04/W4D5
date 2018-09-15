class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.delete(params[:id])
  end


private

def user_params
  params.require(:user).permit(:username, :password)
end

end
#
# Prefix Verb   URI Pattern                                                                              Controller#Action
#                    users GET    /users(.:format) users#index
#                          POST   /users(.:format)  users#create
#                 new_user GET    /users/new(.:format)      users#new
#                edit_user GET    /users/:id/edit(.:format)  users#edit
#                     user GET    /users/:id(.:format)    users#show
#                          PATCH  /users/:id(.:format)   users#update
#                          PUT    /users/:id(.:format)    users#update
#                          DELETE /users/:id(.:format)users#destroy
