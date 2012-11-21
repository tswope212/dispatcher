class MapLatLong < ActiveRecord::Migration
  def up
    add_column :addresses, :latitude,  :float
    add_column :addresses, :longitude, :float
    add_column :addresses, :gmaps, :boolean
  end

  def down
    remove_column :addresses, :latitude
    remove_column :addresses, :longitude
    remove_column :addresses, :gmaps
  end
end
