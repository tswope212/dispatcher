class Unit < ActiveRecord::Base
  belongs_to :address
  attr_accessible :name, :address_id
end
