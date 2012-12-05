class UnitNeeds < ActiveRecord::Migration
  def up
    add_column :units, :needs_met, :boolean
    add_column :units, :power_on, :boolean
    add_column :units, :heater_needed, :boolean
    add_column :units, :medical_needs, :text
    add_column :units, :legal_needs, :text
    add_column :units, :fema_number, :string
    add_column :units, :insurance_situation, :text
    add_column :units, :rapid_response_contacted, :boolean
    add_column :units, :tenant_is_owner, :boolean
    add_column :units, :livable, :boolean
  end

  def down
    remove_column :units, :needs_met
    remove_column :units, :power_on
    remove_column :units, :heater_needed
    remove_column :units, :fema_number
    remove_column :units, :legal_needs
    remove_column :units, :medical_needs
    remove_column :units, :insurance_situation
    remove_column :units, :rapid_response_contacted
    remove_column :units, :tenant_is_owner
    remove_column :units, :livable
  end
end
