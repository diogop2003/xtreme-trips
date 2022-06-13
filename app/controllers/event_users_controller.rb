class EventUsersController < ApplicationController
  def create
    @event = Event.find(params["param"])
    @event_user = EventUser.new(event: @event, user: current_user)
    @event_user.save
    redirect_to @event, notice: "You enter in the event!"
    authorize @event_user
  end
end
