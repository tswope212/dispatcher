class ResidentHasCommunicationTools < ActiveRecord::Migration
  def up
    add_column :residents, :has_phone, :boolean
    add_column :residents, :has_smart_phone, :boolean
    add_column :residents, :has_internet_access, :boolean
  end

  def down
    remove_column :residents, :has_phone
    remove_column :residents, :has_smart_phone
    remove_column :residents, :has_internet_access
  end
end
