#coding=utf-8
class Contact < ActiveRecord::Base
  attr_accessible :provider, :way
  belongs_to :user

  validates :provider, :way, presence: true, uniqueness: {scope: :user_id}

  def self.providers
    [['手机', 'mobile'], ['电话', 'phone'], ['QQ', 'qq'], ['人人', 'renren'], ['豆瓣', 'douban']]
  end
end
