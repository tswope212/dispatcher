class CreatePhaseTemplates < ActiveRecord::Migration
  def change
    create_table :phase_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
