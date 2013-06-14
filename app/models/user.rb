require 'open-uri'
class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :friends

  validates :name, uniqueness: true, presence: true
  validates :uid, uniqueness: true, presence: true

  def self.find_or_create_with_auth(auth)
    user =  User.find_by_uid(auth.uid)
    if user.blank?
      user = User.new
      user.uid = auth.uid
    end
    user.name = auth.info.name
    user.description = auth.info.description
    user.image = auth.extra.raw_info.avatar_large
    user.image = auth.info.image if user.image.blank?

    #friends = weibo_client(auth.credentials.token, auth.credentials.expires_at).friendships.friends_bilateral(user.uid)
    #friends.each do |friend|
    #  user.friends << Friend.new(user_id: user.id, friend_type: "bilateral")
    #end

    user.save

    user
  end

  def self.weibo_client(token, expires_at)
    client = WeiboOAuth2::Client.new(APP_CONFIG["weibo_id"], APP_CONFIG["weibo_secret"], :ssl => {:ca_file => Rails.root.join('lib/assets/cacert.pem').to_s})
    client.get_token_from_hash({:access_token => token,:expires_at => expires_at})
    client
  end
end
