class Trail < ApplicationRecord
  has_many :events
  belongs_to :user
  has_one_attached :photo
  has_many :checkpoints
  validates :name, presence: true
  validates :mode, presence: true
  validates :photo, presence: true
  validates :distance, presence: true
end
