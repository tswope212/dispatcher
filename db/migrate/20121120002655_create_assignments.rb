class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :operations_center
      t.belongs_to :task

      t.timestamps
    end
    add_index :assignments, :operations_center_id
    add_index :assignments, :task_id
  end
end
