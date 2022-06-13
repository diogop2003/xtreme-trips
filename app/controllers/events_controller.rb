class EventsController < ApplicationController
  skip_after_action :verify_authorized, only: :my

  def index
    @trail = Trail.find(params[:trail_id])
    @events = policy_scope(Event).where(trail: @trail)
    # raise
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def my
    @events = current_user.events
  end

  def new
    @trail = Trail.find(params[:trail_id])
    @event = Event.new
    authorize @event
  end

  def create
    @trail = Trail.find(params[:trail_id])
    @event = Event.new(event_params)
    @event.trail = @trail
    authorize @event
    if @event.save
      EventUser.create(event: @event, user: current_user)
      redirect_to root_path, notice: "Your event was created!"
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
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
