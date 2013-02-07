class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :message
      t.string :name
      t.string :email
      t.string :ip
      t.integer :read
      t.integer :starred
      t.belongs_to :person
      t.belongs_to :resident
      t.belongs_to :coordinator
      t.belongs_to :team_admin

      t.timestamps
    end
    add_index :feedbacks, :person_id
    add_index :feedbacks, :resident_id
    add_index :feedbacks, :coordinator_id
    add_index :feedbacks, :team_admin_id
  end
end
