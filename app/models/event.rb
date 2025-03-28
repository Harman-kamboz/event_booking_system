class Event < ApplicationRecord
  belongs_to :event_organizer
  has_many :tickets
  has_many :bookings
end
