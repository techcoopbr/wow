class GameFollow < ApplicationRecord
  validates :user_id, :game_id, presence: true
  validates :user_id, uniqueness: { scope: [:game_id] }
  belongs_to :game
  belongs_to :user
end
