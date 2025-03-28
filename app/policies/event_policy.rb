class EventPolicy < ApplicationPolicy
  def create?
    user.organizer?
  end

  def update?
    user.organizer?
  end
end
