class Signature < ActiveRecord::Base
  belongs_to :waiver
  belongs_to :signatory, :polymorphic => true
  belongs_to :resident, :foreign_key => :signatory_id, :conditions => {:signatory_type => 'Resident'}
  belongs_to :person, :foreign_key => :signatory_id, :conditions => {:signatory_type => 'Person'}
  belongs_to :team_admin, :foreign_key => :signatory_id, :conditions => {:signatory_type => 'TeamAdmin'}
  
  attr_accessible :signatory_id, :signatory_type, :waiver_id, :content
  
  define_index do
    indexes resident.name
    indexes person.name
  end
  
  def self.signature_types
    ['E-Signature', 'Acceptance Check Box', 'Video of Verbal Agreement']
  end
end
