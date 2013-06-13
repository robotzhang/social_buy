#coding=utf-8
class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find_by_uid(params[:id])
    client = WeiboOAuth2::Client.new("3373872336", "61c1cad771b81df57ae88034dc9bb830", :ssl => {:ca_file => Rails.root.join('lib/assets/cacert.pem').to_s})
    client.get_token_from_hash({:access_token=>session[:token],:expires_at=>session[:expires_at]})
    statuses = client.statuses
    statuses.update('用微博api发送的微博')
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
