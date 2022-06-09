class Event < ApplicationRecord
  belongs_to :trail
  has_many :users, through: :event_users
end
