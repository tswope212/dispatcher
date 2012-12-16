class Note < ActiveRecord::Base
  belongs_to :job
  belongs_to :category
  attr_accessible :image, :text, :category_id, :category, :job_id
  mount_uploader :image, NoteImageUploader
end
