class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.find_or_create_with_auth(request.env['omniauth.auth'])
    render :template => "users/new"
  end
end
