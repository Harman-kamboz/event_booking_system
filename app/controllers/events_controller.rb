class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_event_organizer, only: [:create, :update]

  def create
    event = current_user.event_organizer.events.create!(event_params)
    render json: event, status: :created
  end

  def index
    render json: Event.all
  end

  def update
    @event = Event.find(params[:id])
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

  def authorize_event_organizer
    render json: { error: 'Not Authorized' }, status: :forbidden unless current_user.organizer?
  end
end
