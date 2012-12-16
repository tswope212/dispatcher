class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text
      t.string :image
      t.belongs_to :job
      t.belongs_to :category

      t.timestamps
    end
    add_index :notes, :job_id
    add_index :notes, :category_id
  end
end
