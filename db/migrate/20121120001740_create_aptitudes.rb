class CreateAptitudes < ActiveRecord::Migration
  def change
    create_table :aptitudes do |t|
      t.belongs_to :person
      t.belongs_to :skill
      t.integer :level
      t.text :description

      t.timestamps
    end
    add_index :aptitudes, :person_id
    add_index :aptitudes, :skill_id
  end
end
