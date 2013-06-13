#coding=utf-8
class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find_by_uid(params[:id])
    @friendships = self.weibo_client.friendships
  end

  def create
    auth = request.env['omniauth.auth']
    @user = User.find_or_create_with_auth(auth)
    self.current_user = @user
    session[:token] = auth.credentials.token
    session[:expires_at] = auth.credentials.expires_at

    redirect_to root_path
  end

  def logout
    self.current_user = nil
  end
end
