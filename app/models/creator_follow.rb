class CreatorFollow < ApplicationRecord
  validates :user_id, :creator_id, presence: true
  validates :user_id, uniqueness: { scope: [:creator_id] }
  belongs_to :user
  belongs_to :creator
end
