class Missionship < ActiveRecord::Base
  attr_accessible :end_date, :mission_id, :start_date, :user_id, :mission, :user, :mission_name
  belongs_to :user
  belongs_to :mission
  validates_presence_of :mission

  def mission_name
    mission.try(:name)
  end

  def mission_name=(name)
    self.mission = Mission.find_by_name(name) if name.present?
  end

end
