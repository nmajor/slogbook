class MissionshipsController < ApplicationController
  autocomplete :mission, :name, :full => true

  def new
    @missionship = Missionship.new
  end

  def create
    @missionship = Missionship.new(params[:missionship])
    @missionship.user = current_user
    if Mission.find_by_name(@missionship.mission_name) 
      @missionship.save
      @success = 1
      @notification = "Mission added successfully."
    else
      @success = 0
      @notification = "Failed to add mission. No mission by that name."
    end
  end

  def edit
    @missionship = Missionship.find(params[:id])
  end

  def update
    @missionship = Missionship.find(params[:id])
    if @missionship.update_attributes(params[:missionship])
      @success = 1
      @notification = "Mission updated successfully."
    else
      @success = 0
      @notification = "Failed to update mission."
    end
  end

  def destroy
    @missionship = Missionship.find(params[:id])
    if @missionship.destroy
      @success = 1
      @notification = "Mission deleted successfully."
    else
      @success = 0
      @notification = "Failed to delete mission."
    end
  end

end
