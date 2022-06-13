class Event < ApplicationRecord
  belongs_to :trail
  has_many :messages
  has_many :event_users
  has_many :users, through: :event_users
end
