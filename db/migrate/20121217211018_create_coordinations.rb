class CreateCoordinations < ActiveRecord::Migration
  def change
    create_table :coordinations do |t|
      t.belongs_to :operations_center
      t.belongs_to :coordinator
      t.belongs_to :team_admin

      t.timestamps
    end
    add_index :coordinations, :operations_center_id
    add_index :coordinations, :coordinator_id
    add_index :coordinations, :team_admin_id
  end
end
