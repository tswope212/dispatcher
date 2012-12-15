class PeopleHavePhotos < ActiveRecord::Migration
  def up
    add_column :people, :image, :string
    add_column :team_admins, :image, :string
    add_column :residents, :image, :string
  end

  def down
    remove_column :people, :image
    remove_column :team_admins, :image
    remove_column :residents, :image
  end
end
