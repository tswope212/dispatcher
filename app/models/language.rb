class Language < ActiveRecord::Base
  has_many :proficiencies
  attr_accessible :name
end
