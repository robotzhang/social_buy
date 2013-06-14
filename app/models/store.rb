class Store < ActiveRecord::Base
  attr_accessible :name, :description, :links_attributes, :businesses_attributes
  belongs_to :user
  has_many :links, :dependent => :destroy
  has_many :businesses, :dependent => :destroy
  accepts_nested_attributes_for :links, :businesses, :allow_destroy => true

  validates :name, presence: true, uniqueness: true

  def self.parser_description(page)
    keywords = page.xpath("//meta[@name='description']/@content").first.value
    description = page.xpath("//meta[@name='keywords']/@content").first.value

    (description.blank? ? "" : description) + " - " + (keywords.blank? ? "" : keywords)
  end
end
