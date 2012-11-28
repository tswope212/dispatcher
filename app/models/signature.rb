class Signature < ActiveRecord::Base
  belongs_to :waiver
  belongs_to :signatory, :polymorphic => true
  attr_accessible :signatory_id, :signatory_type, :waiver_id, :content
  
  def self.signature_types
    ['E-Signature', 'Acceptance Check Box', 'Video of Verbal Agreement']
  end
end
