class UnitHasPersonResponsible < ActiveRecord::Migration
  def up
    add_column :units, :person_id, :integer
  end

  def down
    remove_column :units, :person_id
  end
end
