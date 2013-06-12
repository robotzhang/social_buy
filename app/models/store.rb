class Store < ActiveRecord::Base
  attr_accessible :name, :links_attributes
  has_many :links, :dependent => :destroy
  accepts_nested_attributes_for :links, :allow_destroy => true

  validates :name, presence: true, uniqueness: true
end
