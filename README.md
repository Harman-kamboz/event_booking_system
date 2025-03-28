# Ticket Booking System

## 📌 Setup Instructions
1. Clone the repository:
   ```sh
   git clone https://github.com/Harman-kamboz/event_booking_system.git
   cd ticket_booking_final

2. Install dependencies:
   bundle install

3. Set up the database:
  rails db:create db:migrate db:seed

4. Start Redis:
   redis-server

5. Start Sidekiq:
   sidekiq

6. Run the Rails server:
   rails server

7. API Authentication (JWT):
  - To log in and get a token:
     curl -X POST http://localhost:3000/users/sign_in
      -d '{
      "user": { "email": "your-email@example.com", "password": "your-password" }
      }' -H "Content-Type: application/json"

  - Use the token in API requests:
    Authorization: Bearer your_jwt_token



