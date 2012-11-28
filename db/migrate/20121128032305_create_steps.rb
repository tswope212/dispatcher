class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.belongs_to :phase_template
      t.belongs_to :task
      t.integer :position

      t.timestamps
    end
    
    add_index :steps, :phase_template_id
    add_index :steps, :task_id
  end
end
