class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :customer, optional: true
end
