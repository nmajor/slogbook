class Missionship < ActiveRecord::Base
  attr_accessible :end_date, :mission_id, :start_date, :user_id, :mission, :user
  belongs_to :user
  belongs_to :mission
end
