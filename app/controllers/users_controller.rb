class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find_by_uid(params[:id])
  end

  def create
    @user = User.find_or_create_with_auth(request.env['omniauth.auth'])
    self.current_user = @user
    redirect_to root_path
  end

  def logout
    self.current_user = nil
  end
end
