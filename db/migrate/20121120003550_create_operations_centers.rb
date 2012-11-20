class CreateOperationsCenters < ActiveRecord::Migration
  def change
    create_table :operations_centers do |t|
      t.string :name
      t.text :description
      t.belongs_to :unit

      t.timestamps
    end
    add_index :operations_centers, :unit_id
  end
end
