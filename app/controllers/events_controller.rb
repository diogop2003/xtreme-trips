class EventsController < ApplicationController
  def index
    @events = Event.all
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

  private

  def event_params
    params.require(:event).permit(:date, :name)
  end
end
