class Mission < ActiveRecord::Base
  attr_accessible :country, :mtc, :name
  has_many :missionships
  has_many :users, :through => :missionships
  has_many :slogs
end
