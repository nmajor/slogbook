class Call < ActiveRecord::Base
  attr_accessible :mission_id, :start_date, :user_id, :mission_name
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
