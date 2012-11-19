class Address < ActiveRecord::Base
  belongs_to :street
  attr_accessible :street_number, :street_id
  
  def name
    "#{street_number} #{street.name}"
  end
end
