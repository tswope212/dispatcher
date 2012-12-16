class TeamsAndResidencesHaveImage < ActiveRecord::Migration
  def up
    add_column :teams, :image, :string
    add_column :units, :image, :string
  end

  def down
    remove_column :teams, :image
    remove_column :units, :image
  end
end
