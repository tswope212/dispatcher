class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.belongs_to :waiver
      t.string :signatory_type
      t.integer :signatory_id
      t.string :content

      t.timestamps
    end
    add_index :signatures, :waiver_id
  end
end
