class CheckpointsController < ApplicationController
  def create
    @trail = Trail.find(params[:trail_id])
    @checkpoint = Checkpoint.new
    @checkpoint.trail = @trail
    @checkpoint.user = current_user
    @checkpoint.latitude = params[:lat]
    @checkpoint.longitude = params[:long]
    authorize @checkpoint
    @checkpoint.save!
  end
end
