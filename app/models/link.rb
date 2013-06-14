require 'open-uri'
class Link < ActiveRecord::Base
  attr_accessible :url, :name
  belongs_to :store

  #validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: {scope: :store_id}

  def self.parser(url)
    link = Link.new
    page = Nokogiri::HTML(open(url))
    link.url = url
    link.name = page.css("title").text

    [page, link]
  end
end
