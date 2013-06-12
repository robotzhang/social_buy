class Store < ActiveRecord::Base
  attr_accessible :name, :links_attributes, :businesses_attributes
  has_many :links, :dependent => :destroy
  has_many :businesses, :dependent => :destroy
  accepts_nested_attributes_for :links, :businesses, :allow_destroy => true

  validates :name, presence: true, uniqueness: true
end
