class CreateTaskWaivers < ActiveRecord::Migration
  def change
    create_table :task_waivers do |t|
      t.belongs_to :task
      t.belongs_to :waiver
      t.belongs_to :team_admin

      t.timestamps
    end
    add_index :task_waivers, :task_id
    add_index :task_waivers, :waiver_id
    add_index :task_waivers, :team_admin_id
  end
end
