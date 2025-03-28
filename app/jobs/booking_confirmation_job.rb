class BookingConfirmationJob < ApplicationJob
  queue_as :default

  def perform(booking_id)
    booking = Booking.find(booking_id)
    puts "Email confirmation: Ticket booked for #{booking.customer.user.email} (Booking ID: #{booking.id})"
  end
end
