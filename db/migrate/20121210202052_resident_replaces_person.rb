class ResidentReplacesPerson < ActiveRecord::Migration
  def up
    add_column :residents, :date_of_birth, :date
    Unit.all.each do |unit|
      if unit.person.present?
        person = unit.person
        resident = Resident.create person.attributes.except('id', 'signed_waiver')
        resident.save :validate => false
        person.signatures.update_all :signatory_id => resident.id, :signatory_type => 'Resident'
        unit.person.destroy
        unit.person_id = resident.id
        unit.save
      end
    end
    rename_column :units, :person_id, :resident_id
  end

  def down
    rename_column :units, :resident_id, :person_id
  end
end
