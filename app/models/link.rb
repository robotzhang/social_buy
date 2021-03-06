require 'open-uri'
class Link < ActiveRecord::Base
  attr_accessible :url, :name
  belongs_to :store

  #validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: {scope: :store_id}

  before_create do
    self.url = self.url.starts_with?('http') ? self.url : 'http://' + self.url
    page, link = Link.parser(self.url)
    self.name = link.name
    self.favicon = link.favicon
  end

  def self.parser(url)
    link = Link.new
    page = Nokogiri::HTML(open(url))
    link.url = url
    link.name = page.css("title").text
    favicon = page.xpath("//link[translate(
      @rel,
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      'abcdefghijklmnopqrstuvwxyz'
    )='shortcut icon']/@href") # 大小写不相关
    link.favicon = favicon.blank? ? "" : favicon.first.value

    [page, link]
  end
end
