class User < ActiveRecord::Base
  has_many :slogs
  has_many :missionships
  has_many :missions, :through => :missionships
  has_one :call
  has_one :mission, :through => :call
  acts_as_voter
  
  extend FriendlyId
  friendly_id :username
  
  validates_presence_of :username
  validates_presence_of :yob, :message => '- Please enter your year of birth'
  validates_uniqueness_of :username
  after_validation :validate_reserved

  def validate_reserved
    if @errors[:friendly_id].present?
      @errors[:username] = "is reserved. Please choose something else"
      @errors.messages.delete(:friendly_id)
    end
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :lockable 
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login, :image, :role,
                  :yob, :gender, :avatar, :avatar_cache, :remove_avatar, :remote_avatar_url

  attr_accessor :login
  mount_uploader :avatar, AvatarUploader

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  ROLES = %[admin moderator]

  def role?(role)
    self.role == role.to_s
  end

end
