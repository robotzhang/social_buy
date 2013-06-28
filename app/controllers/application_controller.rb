class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
    @stores = Store.includes([:user]).page(params[:page]).per(10).all
    render :template => "index"
  end

  def weibo_client
    client = WeiboOAuth2::Client.new(APP_CONFIG["weibo_id"], APP_CONFIG["weibo_secret"], :ssl => {:ca_file => Rails.root.join('lib/assets/cacert.pem').to_s})
    client.get_token_from_hash({:access_token=>session[:token],:expires_at=>session[:expires_at]})
    client
  end

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? user : user.id
  end

  def signed_in?
    !current_user.nil?
  end

  helper_method :current_user, :signed_in?, :weibo_client
end
