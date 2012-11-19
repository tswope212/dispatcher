class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.belongs_to :city

      t.timestamps
    end
    add_index :neighborhoods, :city_id
  end
end
