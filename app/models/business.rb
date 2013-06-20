class Business < ActiveRecord::Base
  attr_accessible :name
  validate presence: true, uniqueness: {scope: :store_id}
  belongs_to :store

  def self.find_or_new_by_names(names)
    businesses = self.where(name: names.uniq).all
    businesses ||= []
    (names - businesses.map{|b| b.name}).each do |name|
      businesses << Business.new(name: name)
    end

    businesses
  end
end
