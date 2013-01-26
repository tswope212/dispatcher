class Address < ActiveRecord::Base
  belongs_to :street
  has_one :city, :through => :street
  has_many :units, :dependent => :destroy
  has_many :jobs, :through => :units
  belongs_to :neighborhood
  attr_accessible :street_number, :street_id, :zip_code, :neighborhood_id, :street, :neighborhood
  scope :ordered, order(:street_number)
  scope :address_order, joins(:street).order('streets.name').order(:street_number)
  
  acts_as_gmappable :validation => false

  def gmaps4rails_address
    "#{street_number} #{street.andand.name}, #{city.andand.name} #{zip_code}"
  end
  
  def name
    "#{street_number} #{street.andand.name}"
  end
  
  def full
    "#{name}\n#{city.andand.name}\n#{zip_code}"
  end
end
