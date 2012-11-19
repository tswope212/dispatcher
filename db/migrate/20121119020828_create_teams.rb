class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.belongs_to :person

      t.timestamps
    end
    add_index :teams, :person_id
  end
end
