class WaiverTypes < ActiveRecord::Migration
  def up
    add_column :waivers, :visible_to_volunteers, :boolean
    add_column :waivers, :visible_to_residents, :boolean
  end

  def down
    remove_column :waivers, :visible_to_volunteers
    remove_column :waivers, :visible_to_residents
  end
end
