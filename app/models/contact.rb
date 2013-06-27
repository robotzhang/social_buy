#coding=utf-8
class Contact < ActiveRecord::Base
  attr_accessible :provider, :way
  belongs_to :user

  validates :provider, :way, presence: true, uniqueness: {scope: :user_id}

  def self.providers(contacts=[])
    providers = [['手机', 'mobile'], ['电话', 'phone'], ['QQ', 'qq'], ['人人', 'renren'], ['豆瓣', 'douban']]
    deletes = []
    contacts.each do |contact|
      providers.each do |provider|
        if contact.provider == provider[1]
          deletes << provider
          break
        end
      end
    end

    providers - deletes
  end

  def provider_cn
    Contact.providers.each do |p|
      return p[0] if p[1] == self.provider
    end

    self.provider
  end
end
