class CallsController < ApplicationController
  autocomplete :mission, :name, :full => true

  def new
    @call = Call.new
  end

  def create
    @call = Call.new(params[:call])
    @call.user = current_user
    if Mission.find_by_name(@call.mission_name)
      @call.save
      @success = 1
      @notification = "Mission call added successfully."
    else
      @success = 0
      @notification = "Failed to add mission call. No mission by that name."
    end
  end

  def destroy
    @call = Call.find(params[:id])
    if @call.destroy
      @success = 1
      @notification = "Mission deleted successfully."
    else
      @success = 0
      @notification = "Failed to delete mission."
    end
  end

end
