class ResidentHasVehicle < ActiveRecord::Migration
  def up
    add_column :residents, :vehicles, :string
  end

  def down
    remove_column :residents, :vehicles
  end
end
