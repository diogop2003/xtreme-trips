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

  private

  def event_params
    params.require(:event).permit(:date, :name)
  end
end
