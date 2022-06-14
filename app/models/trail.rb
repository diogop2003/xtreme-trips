class Trail < ApplicationRecord
  has_many :events
  belongs_to :user
  has_one_attached :photo
  has_many :checkpoints
end
