class EventsController < ApplicationController
  include Pundit
  before_action :authenticate_user!

  def create
    @event = current_user.event_organizer.events.create!(event_params)
    authorize @event
    render json: event, status: :created
  end

  def index
    events = policy_scope(Event)
    render json: events
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    if @event.update(event_params)
      EventUpdateNotificationJob.perform_later(@event.id)
      render json: { message: 'Event updated! Notifications will be sent.' }
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  private

  def event_params
    params.require(:event).permit(:name, :date, :venue)
  end
end
