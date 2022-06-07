class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def new
    @trails = Trail.new
  end

  def create
    @trails = Trail.new(trails_params)
    if @trails.save
      redirect_to root_path, notice: "Your trails was created!"
    else
      render :new
    end
  end

  def destroy
    @trails = Trail.find(params[:id])
    @trails.destroy
    redirect_to trails_path, alert: "Your trails has been deleted"
  end

  def edit
    @trails = Trail.find(params[:id])
  end

  def update
    @trails = Trail.find(params[:id])

    if @trails.update(trails_params)
      redirect_to trailss_path, notice: "Your trails was updated!"
    else
      render :edit
    end
  end

  private

  def trails_params
    params.require(:trails).permit(:mode, :distance, :name)
  end
end
