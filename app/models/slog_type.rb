class SlogType < ActiveRecord::Base
  attr_accessible :name
  has_many :slogs
end
