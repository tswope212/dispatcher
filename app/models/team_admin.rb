class TeamAdmin < ActiveRecord::Base
  mount_uploader :image, ProfileImageUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :personal_statement, :first_name, :last_name, :phone_number, :date_of_birth, :image
  
  after_create :send_activation_message
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def send_activation_message
    TaylorMailer.activation_authorization(self).deliver
  end
  
  def active_for_authentication?
    active?
  end
  
  def self.taylor
    find_by_email 'tswope212@gmail.com'
  end
end
