
# Create Users
admin = User.create!(email: "admin12@example.com", password: "password123", role: "organizer")
customer1 = User.create!(email: "customer11@example.com", password: "password123", role: "customer")
customer2 = User.create!(email: "customer22@example.com", password: "password123", role: "customer")

# Create Event Organizers
organizer = EventOrganizer.create!(user: admin, name: "John Doe Events")

# Create Customers
customer1_profile = Customer.create!(user: customer1, name: "Alice Smith")
customer2_profile = Customer.create!(user: customer2, name: "Bob Johnson")

# Create Events
event1 = Event.create!(name: "Rock Concert", date: Date.today + 10, venue: "Madison Square Garden", event_organizer: organizer)

event2 = Event.create!(name: "Tech Conference 2025", date: Date.today + 30, venue: "Silicon Valley Conference Center",
  event_organizer: organizer
)

# Create Tickets
Ticket.create!(event: event1, customer: customer1_profile, price: 50.0)
Ticket.create!(event: event1, customer: customer2_profile, price: 50.0)
Ticket.create!(event: event2, customer: customer1_profile, price: 100.0)

puts "Seed data created successfully!"
