class Proficiency < ActiveRecord::Base
  belongs_to :language
  belongs_to :speaker, :polymorphic => true
  attr_accessible :level, :speaker_id, :speaker_type, :language_id, :language, :speaker
end
