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

    @checkpoints = Checkpoint.where(trail: @trail).order(:created_at).to_a

    @array = @checkpoints.map do |checkpoint|
      [checkpoint.longitude, checkpoint.latitude]
    end
    @array = @array.uniq

    render json: @array
  end

  def new
    @trail = Trail.find(params[:trail_id])
    @checkpoint = Checkpoint.new
    @checkpoints = Checkpoint.where(trail: @trail).to_a
    @trail.checkpoints.order(:created_at)
    unless @checkpoints.empty?
      @array = @checkpoints.map do |checkpoint|
        [checkpoint.longitude, checkpoint.latitude]
      end
      @array = @array.uniq
      @marker = @array.last
    end
    authorize @checkpoint
  end
end
