class CarbonMonoxideDetectorAndReturnPlans < ActiveRecord::Migration
  def up
    add_column :units, :need_carbon_monoxide_detector, :boolean
    add_column :units, :plan_to_return, :boolean
  end

  def down
    remove_column :units, :need_carbon_monoxide_detector
    remove_column :units, :plan_to_return
  end
end
