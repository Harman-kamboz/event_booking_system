class BookingsController < ApplicationController
  include Pundit
  before_action :authenticate_user!

  def index
    bookings = policy_scope(Booking)
    render json: bookings
  end

  def create
    @booking = current_user.customer.bookings.new(booking_params)
    authorize @booking
    if @booking.save
      BookingConfirmationJob.perform_later(@booking.id)
      render json: { message: 'Booking successful! Confirmation email will be sent.' }, status: :created
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  private

  def booking_params
    params.require(:booking).permit(:event_id, :ticket_id, :quantity)
  end
end
