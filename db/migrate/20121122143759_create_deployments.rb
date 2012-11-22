class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.belongs_to :city
      t.belongs_to :team
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
    add_index :deployments, :city_id
    add_index :deployments, :team_id
  end
end
