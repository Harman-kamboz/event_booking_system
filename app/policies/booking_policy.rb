class BookingPolicy < ApplicationPolicy
  def create?
    user.customer?
  end
end
