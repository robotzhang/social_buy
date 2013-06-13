class User < ActiveRecord::Base
  # attr_accessible :title, :body
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
    user.save

    user
  end
end
