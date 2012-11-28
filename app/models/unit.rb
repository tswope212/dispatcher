class Unit < ActiveRecord::Base
  belongs_to :address
  has_one :city, :through => :address
  has_one :neighborhood, :through => :address
  has_many :tasks
  attr_accessible :name, :address_id
  
  before_create :populate_default_unit_name
  
  def full_name
    "#{name} at #{address.name}"
  end
  
  def full_address
    "#{name}\n#{address.full}"
  end
  
  def populate_default_unit_name
    self.name = 'Main Unit' if name.blank?
  end
end
