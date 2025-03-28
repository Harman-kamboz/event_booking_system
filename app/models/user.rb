class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable, :recoverable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null
  
  enum role: { customer: 0, organizer: 1 }

  has_one :event_organizer
  has_one :customer
  after_create :create_associated_profile

  private

  def create_associated_profile
    if customer?
      create_customer!
    elsif organizer?
      create_event_organizer!
    end
  end
end
