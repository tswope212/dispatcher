class RequiredWaivers < ActiveRecord::Migration
  def up
    add_column :waivers, :required_for_volunteers, :boolean
    add_column :waivers, :required_for_residents, :boolean
  end

  def down
    remove_column :waivers, :required_for_volunteers
    remove_column :waivers, :required_for_residents
  end
end
