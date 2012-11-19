class Address < ActiveRecord::Base
  belongs_to :street
  attr_accessible :street_number, :street_id
end
