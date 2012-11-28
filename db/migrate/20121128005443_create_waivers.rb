class CreateWaivers < ActiveRecord::Migration
  def change
    create_table :waivers do |t|
      t.string :name
      t.text :text
      t.string :signature_type

      t.timestamps
    end
  end
end
