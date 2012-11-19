class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :street_number
      t.belongs_to :street

      t.timestamps
    end
    add_index :addresses, :street_id
  end
end
