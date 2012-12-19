class WhetherUnitWillBeHelped < ActiveRecord::Migration
  def up
    add_column :units, :will_not_be_helped, :boolean
  end

  def down
    remove_column :units, :will_be_helped
  end
end
