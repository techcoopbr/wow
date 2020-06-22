class CreatorFollow < ApplicationRecord
  validates :user_id, :creator_id, presence: true
  belongs_to :user
  belongs_to :creator
end
