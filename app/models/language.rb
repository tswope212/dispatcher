class Language < ActiveRecord::Base
  has_many :proficiencies
  has_many :people, :through => :proficiencies, :class_name => 'Person', :source => :speaker, :conditions => "proficiencies.speaker_type = 'Person'"
  has_many :teams, :through => :people
  
  attr_accessible :name
end
