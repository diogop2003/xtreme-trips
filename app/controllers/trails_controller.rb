class TrailsController < ApplicationController
  def index
    @trails = policy_scope(Trail)
  end

  def show
    @trail = Trail.find(params[:id])
    #Achar todos os checkpoints da trail
    @checkpoints = Checkpoint.where(trail_id: @trail)
    #Ordenar os checkpoints pelo created_at  @trail.checkpoints.order(:created_at)
    @trail.checkpoints.order(:created_at)
    #Iterar em cima de todos os checkpoints
    #Para cada checkpoint fazer uma array com lat e long
    @checkpoints.map do |checkpoint|
      [checkpoint.latitude, checkpoint.longitude]
    end
    #Colocar essa array dentro de outra Array maior para mandar para view @
    @array = [@checkpoints]
    authorize @trail
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
      redirect_to root_path, notice: "Your trails was created!"
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
    params.require(:trail).permit(:mode, :distance, :name)
  end
end
