class Mission < ActiveRecord::Base
  attr_accessible :region, :active, :name
  has_many :missionships
  has_many :users, :through => :missionships
  has_many :calls
  has_one :users, :through => :calls
  has_many :slogs
end
