class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.belongs_to :address

      t.timestamps
    end
    add_index :units, :address_id
  end
end
