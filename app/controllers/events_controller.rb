class EventsController < ApplicationController
  def index
    @trail = Trail.find(params[:trail_id]) 
    @events = Event.where(trail_id: @trail)
  end
  
  def show
    @trail = Trail.find(params[:trail_id])
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:trail_id])
  end

  def edit
    @event = Event.find(params[:trail_id])
  end

  def update
    @event = Event.find(params[:trail_id])

    if @event.update(event_params)
      redirect_to events_path, notice: "Your events was updated!"
    else
      render :edit
    end
  end
  
  def new
    @trail = Trail.find(params[:trail_id])
    @event = Event.new
  end

  def create
    @trail = Trail.find(params[:trail_id])
    @event = Event.new(event_params)
    @event.trail = @trail
    if @event.save
      redirect_to root_path, notice: "Your event was created!"
    else
      render :new
    end
  end

  def edit
    @trail = Trail.find(params[:trail_id])
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to root_path, notice: "Your events was updated!"
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :name)
  end
end
