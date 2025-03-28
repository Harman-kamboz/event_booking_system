class EventUpdateNotificationJob < ApplicationJob
  queue_as :event

  def perform(event_id)
    event = Event.find(event_id)
    customers = event.bookings.map(&:customer)

    customers.each do |customer|
      puts "Notification email: Event '#{event.name}' updated! Notifying #{customer.user.email}"
    end
  end
end
