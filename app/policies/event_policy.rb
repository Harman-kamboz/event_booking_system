class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.organizer?
        scope.where(event_organizer: user.event_organizer) # Only return organizer's events
      else
        scope.all # Customers can see all public events
      end
    end
  end

  def create?
    user.organizer?
  end

  def update?
    user.organizer?
  end
end
