class EventsController < ApplicationController
  def index
    @events = Event.all
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
    params.require(:event).permit(:name, :date)
  end
end
