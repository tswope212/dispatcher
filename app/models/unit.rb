class Unit < ActiveRecord::Base
  belongs_to :address
  belongs_to :person
  has_one :city, :through => :address
  has_one :neighborhood, :through => :address
  has_many :jobs
  attr_accessible :name, :address_id, :livable, :tenant_is_owner, :legal_needs, :medical_needs, :fema_number, :insurance_situation, :rapid_response_contacted, :power_on, :heater_needed, :needs_met
  
  before_create :populate_default_unit_name
  
  def full_name
    "#{name} at #{address.name}"
  end
  
  def full_address
    "#{name}\n#{address.full}"
  end
  
  def populate_default_unit_name
    self.name = 'Main Unit' if name.blank?
  end
end
