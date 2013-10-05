class User < ActiveRecord::Base
  has_many :slogs
  has_many :missionships
  has_many :missions, :through => :missionships
  has_one :call
  has_one :mission, :through => :call
  extend FriendlyId
  friendly_id :username

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :lockable 
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login, :image, :role,
                  :dob, :firstname, :lastname, :gender, :avatar, :avatar_cache, :remove_avatar, :remote_avatar_url
  attr_readonly :username
  validates_uniqueness_of :username
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
