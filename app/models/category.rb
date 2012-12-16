class Category < ActiveRecord::Base
  has_many :notes, :dependent => :nullify
  attr_accessible :name
  scope :alphabetical, order(:name)
end
