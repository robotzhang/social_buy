class Link < ActiveRecord::Base
  attr_accessible :url, :name
  belongs_to :store

  #validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
