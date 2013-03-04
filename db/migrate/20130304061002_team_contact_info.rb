class TeamContactInfo < ActiveRecord::Migration
  def up
    add_column :teams, :phone_number, :string
    add_column :teams, :email, :string
  end

  def down
    remove_column :teams, :phone_number
    remove_column :teams, :email
  end
end
