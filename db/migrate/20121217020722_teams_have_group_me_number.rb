class TeamsHaveGroupMeNumber < ActiveRecord::Migration
  def up
    add_column :teams, :group_me_number, :string
  end

  def down
    remove_column :teams, :group_me_number
  end
end
