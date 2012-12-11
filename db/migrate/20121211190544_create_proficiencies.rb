class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.belongs_to :language
      t.string :speaker_type
      t.integer :speaker_id
      t.integer :level

      t.timestamps
    end
    add_index :proficiencies, :language_id
  end
end
