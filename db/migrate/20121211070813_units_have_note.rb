class UnitsHaveNote < ActiveRecord::Migration
  def up
    add_column :units, :note, :text
  end

  def down
    remove_column :units, :note
  end
end
