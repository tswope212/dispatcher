class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.belongs_to :person
      t.belongs_to :team
      t.belongs_to :skill

      t.timestamps
    end
    add_index :roles, :person_id
    add_index :roles, :team_id
    add_index :roles, :skill_id
  end
end
