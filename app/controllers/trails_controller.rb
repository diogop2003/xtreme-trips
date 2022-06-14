class TrailsController < ApplicationController
  def index
    @trails = policy_scope(Trail)
  end

  def show
    @trail = Trail.find(params[:id])
    @checkpoints = Checkpoint.where(trail: @trail).to_a
    @trail.checkpoints.order(:created_at)
    authorize @trail
    unless @checkpoints.empty?
      @array = @checkpoints.map do |checkpoint|
        [checkpoint.longitude, checkpoint.latitude]
      end
      @array = @array.uniq
      @marker = @array.last
    end
  end

  def my
    @trails = current_user.trails
    authorize @trails
  end

  def new
    @trail = Trail.new
    authorize @trail
  end

  def create
    @trail = Trail.new(trail_params)
    @trail.user = current_user
    authorize @trail
    if @trail.save
      redirect_to new_trail_checkpoint_path(@trail), notice: "Your trails was created!"
    else
      render :new
    end
  end

  def edit
    @trail = Trail.find(params[:id])
    authorize @trail
  end

  def update
    @trail = Trail.find(params[:id])
    authorize @trail

    if @trail.update(trail_params)
      redirect_to root_path, notice: "Your trails was updated!"
    else
      render :edit
    end
  end

  private

  def trail_params
    params.require(:trail).permit(:mode, :distance, :name, :photo)
  end
end
