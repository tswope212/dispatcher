class Resident < ActiveRecord::Base
  has_many :units, :dependent => :destroy
  has_many :signatures, :as => :signatory, :dependent => :destroy
  has_many :proficiencies, :as => :speaker
  has_many :languages, :through => :proficiencies
  has_many :signatures, :as => :signatory, :dependent => :destroy
  has_many :waivers, :through => :signatures
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, "first_name", "last_name","primary_phone_number", "encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at", "sign_in_count", "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip", "confirmation_token","confirmed_at", "confirmation_sent_at", :date_of_birth, :signed_waiver, :unconfirmed_email, :authentication_token, :created_at, :updated_at
  
  before_validation :use_phone_for_email_if_necessary, :on => :create
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def use_phone_for_email_if_necessary
    return true unless email.blank?
    return false if primary_phone_number.blank?
    phone_number_without_spaces = primary_phone_number.gsub(/\s/, '')
    self.email = "#{phone_number_without_spaces}@disasterdispatcher.net"
  end
  
  def has_signed_waiver? waiver
    waivers.include? waiver
  end
  
end
