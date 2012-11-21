class Unit < ActiveRecord::Base
  belongs_to :address
  has_many :tasks
  attr_accessible :name, :address_id
  
  def full_name
    "#{name} at #{address.name}"
  end
end
