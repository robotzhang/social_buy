class Store < ActiveRecord::Base
  attr_accessible :name, :description, :links_attributes, :businesses_attributes
  belongs_to :user
  has_many :links, :dependent => :destroy
  has_many :businesses, :dependent => :destroy
  accepts_nested_attributes_for :links, :businesses, :allow_destroy => true

  has_one :theme

  validates :name, presence: true, uniqueness: true

  def self.parser_description(page)
    keywords = page.xpath("//meta[translate(
      @name,
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      'abcdefghijklmnopqrstuvwxyz'
    ) = 'description']/@content")
    keywords = keywords.blank? ? "" : keywords.first.value
    description = page.xpath("//meta[translate(
      @name,
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      'abcdefghijklmnopqrstuvwxyz'
    ) = 'keywords']/@content")
    description = description.blank? ? "" : description.first.value
    ret = description + " - " + keywords
    return "" if ret == ' - '
    ret
  end

  def self.new_with_url(url)
    store = Store.new
    page, link = Link.parser(url)
    store.name = link.name
    store.description = Store.parser_description(page)
    store.links << link
    store.businesses = [Business.new] if store.businesses.blank?

    store
  end
end
