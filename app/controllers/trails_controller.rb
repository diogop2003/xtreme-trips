class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      redirect_to trails_path, notice: "Your trails was created!"
    else
      render :new
    end
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    @trail = Trail.find(params[:id])

    if @trail.update(trail_params)
      redirect_to trailss_path, notice: "Your trails was updated!"
    else
      render :edit
    end
  end

  private

  def trail_params
    params.require(:trail).permit(:mode, :distance, :name)
  end
end
