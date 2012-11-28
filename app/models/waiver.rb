class Waiver < ActiveRecord::Base
  has_many :signatures
  attr_accessible :signature_type, :text, :name
end
