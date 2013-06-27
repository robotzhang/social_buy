#coding=utf-8
class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :stores]
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
    redirect_to (params[:back_url] || root_path)
  end

  def stores

  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
  end

  protected
  def find_user
    @user = User.find_by_uid(params[:id])
    render_404 if @user.nil?
  end
end
