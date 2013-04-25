class NoteUpdatedBy < ActiveRecord::Migration
  def up
    add_column :units, :note_updated_by, :integer
    add_column :units, :note_updated_at, :datetime
  end

  def down
    remove_column :units, :note_updated_by
    remove_column :units, :note_updated_at
  end
end
