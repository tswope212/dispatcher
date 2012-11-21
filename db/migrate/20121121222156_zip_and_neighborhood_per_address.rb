class ZipAndNeighborhoodPerAddress < ActiveRecord::Migration
  def up
    add_column :addresses, :zip_code, :string
    add_column :addresses, :neighborhood_id, :integer
  end

  def down
    remove_column :addresses, :zip_code
    remove_column :addresses, :neighborhood_id
  end
end
