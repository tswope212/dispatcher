class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :primary_phone_number, :date_of_birth
  # attr_accessible :title, :body
  
  scope :alphabetical_by_first_name, :order => :first_name
  scope :alphabetical_by_last_name, :order => :last_name
  scope :alphabetical_by_phone, :order => :primary_phone_number
  scope :alphabetical_by_email, :order => :email
  def name
    "#{first_name} #{last_name}"
  end
end
