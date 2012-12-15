class Person < ActiveRecord::Base
  has_many :aptitudes, :dependent => :destroy
  has_many :skills, :through => :aptitudes
  has_many :roles, :dependent => :destroy
  has_many :teams, :through => :roles
  has_many :led_teams, :class_name => 'Team', :dependent => :nullify
  has_many :signatures, :as => :signatory, :dependent => :destroy
  has_many :waivers, :through => :signatures
  has_many :proficiencies, :as => :speaker
  has_many :languages, :through => :proficiencies
  
  mount_uploader :image, ProfileImageUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :primary_phone_number, :date_of_birth, :image
  # attr_accessible :title, :body
  
  scope :alphabetical_by_first_name, :order => :first_name
  scope :alphabetical_by_last_name, :order => :last_name
  scope :alphabetical_by_phone, :order => :primary_phone_number
  scope :alphabetical_by_email, :order => :email
  def name
    "#{first_name} #{last_name}"
  end
  
  def aptitude_at_skill skill
    aptitudes.find_by_skill_id(skill.andand.id).andand.level.to_i
  end
  
  def is_on_team? team
    teams.include? team
  end
  
  def has_signed_waiver? waiver
    waivers.include? waiver
  end
  
  def has_skill? skill
    skills.include? skill
  end
end
