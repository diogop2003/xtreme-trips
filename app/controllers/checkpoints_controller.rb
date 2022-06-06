class CheckpointsController < ApplicationController
  def create
    @checkpoints = Checkpoints.new(checkpoints_params)
    @checkpoints.save
  end

  private

  def checkpoints_params
    params.require(:checkpoints).permit(:latitude, :longitude, :start_point, :end_point)
  end
end
