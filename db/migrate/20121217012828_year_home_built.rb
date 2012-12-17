class YearHomeBuilt < ActiveRecord::Migration
  def up
    add_column :units, :year_built, :date
  end

  def down
    remove_column :units, :year_built
  end
end
