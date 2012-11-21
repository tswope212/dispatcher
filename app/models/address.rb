class Address < ActiveRecord::Base
  belongs_to :street
  has_one :city, :through => :street
  has_many :units
  has_many :tasks, :through => :units
  attr_accessible :street_number, :street_id
  
  acts_as_gmappable

  def gmaps4rails_address
    "#{street_number} #{street.name}, #{city.name}"
  end
  
  def name
    "#{street_number} #{street.name}"
  end
end
