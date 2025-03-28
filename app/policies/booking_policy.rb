class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.customer?
        scope.where(customer: user.customer) # Customers see only their bookings
      else
        scope.none # Organizers shouldn't see bookings (unless required)
      end
    end
  end

  def create?
    user.customer?
  end
end
