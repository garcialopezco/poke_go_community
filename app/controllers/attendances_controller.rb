class AttendancesController < ApplicationController
  before_action :require_authentication! 

  def create
    @raid = Raid.find(params[:raid_id])
    @raid.add_attendee(current_user)

    redirect_to raids_path
  end
end
