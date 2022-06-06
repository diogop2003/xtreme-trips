class TrailsController < ApplicationController
  def index
    @trails = Trails.all
  end

  def new
    @trails = Trails.new

  end

  def create
    @trails = Trails.new(trails_params)
    if @trails.save
      redirect_to root_path, notice: "Your trails was created!"
    else
      render :new
    end
  end

  def destroy
    @trails = Trails.find(params[:id])
    @trails.destroy
    redirect_to trails_path, alert: "Your trails has been deleted"
  end

  def edit
    @trails = Trails.find(params[:id])
  end

  def update
    @trails = Trails.find(params[:id])

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
