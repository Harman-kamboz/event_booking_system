class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_customer, only: [:create]

  def create
    @booking = current_user.customer.bookings.new(booking_params)
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

  def authorize_customer
    render json: { error: 'Not Authorized' }, status: :forbidden unless current_user.customer?
  end
end
