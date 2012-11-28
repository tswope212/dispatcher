class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :task
      t.belongs_to :unit
      t.datetime :scheduled_start
      t.datetime :scheduled_end
      t.datetime :actual_start
      t.datetime :actual_end      

      t.timestamps
    end
    
    remove_column :tasks, :unit_id
    remove_column :tasks, :person_id
    remove_column :tasks, :scheduled_start
    remove_column :tasks, :scheduled_end
    remove_column :tasks, :actual_start
    remove_column :tasks, :actual_end
    rename_column :assignments, :task_id, :job_id
    rename_column :dispatches, :task_id, :job_id
    
    remove_index :assignments, :task_id
    add_index :assignments, :job_id
    remove_index :dispatches, :task_id
    add_index :dispatches, :job_id
    
    add_index :jobs, :task_id
    add_index :jobs, :unit_id
  end
end
