class Unit < ActiveRecord::Base
  belongs_to :address
  belongs_to :resident

  has_one :city, :through => :address
  has_one :neighborhood, :through => :address
  has_one :street, :through => :address

  has_many :jobs, :dependent => :destroy
  has_many :tasks, :through => :jobs
  has_many :operations_centers, :dependent => :nullify

  attr_accessible :name, :address_id, :livable, :tenant_is_owner, :legal_needs, :medical_needs, :fema_number, :insurance_situation, :rapid_response_contacted, :power_on, :heater_needed, :needs_met, :resident, :note, :address, :image, :plan_to_return, :need_carbon_monoxide_detector, :year_built, :will_not_be_helped
  mount_uploader :image, ProfileImageUploader
  
  before_create :populate_default_unit_name
  after_destroy :remove_orphaned_address_and_resident
  
  scope :updated, order('updated_at desc')
  
  define_index do
    indexes name
    indexes note
    indexes street.name, :as => :street
    indexes city.name, :as => :city
    indexes address.zip_code
    indexes resident.email
    indexes resident.primary_phone_number
    indexes created_at
    indexes updated_at
    indexes tasks.name, :as => :jobs
  end
  
  def full_name
    "#{name} at #{address.andand.name}"
  end
  
  def full_address
    "#{name}\n#{address.andand.full}"
  end
  
  def populate_default_unit_name
    self.name = 'Main Unit' if name.blank?
  end
  
  def remove_orphaned_address_and_resident
    address.destroy if address.units.empty?
    resident.destroy if resident.units.empty?
  end
end
