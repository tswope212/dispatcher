class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.belongs_to :person
      t.belongs_to :unit
      t.datetime :scheduled_start
      t.datetime :scheduled_end
      t.datetime :actual_start
      t.datetime :actual_end

      t.timestamps
    end
    add_index :tasks, :person_id
    add_index :tasks, :unit_id
  end
end
