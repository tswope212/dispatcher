class Address < ActiveRecord::Base
  belongs_to :street
  has_one :city, :through => :street
  has_many :units
  has_many :jobs, :through => :units
  belongs_to :neighborhood
  attr_accessible :street_number, :street_id, :zip_code, :neighborhood_id
  
  acts_as_gmappable

  def gmaps4rails_address
    "#{street_number} #{street.name}, #{city.name} #{zip_code}"
  end
  
  def name
    "#{street_number} #{street.name}"
  end
  
  def full
    "#{name}\n#{city.name}\n#{zip_code}"
  end
end
