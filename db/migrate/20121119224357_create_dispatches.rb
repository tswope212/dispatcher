class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|
      t.belongs_to :team
      t.belongs_to :task
      t.belongs_to :person

      t.timestamps
    end
    add_index :dispatches, :team_id
    add_index :dispatches, :task_id
    add_index :dispatches, :person_id
  end
end
