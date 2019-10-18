class Game < ApplicationRecord
  has_many :game_creators
  has_many :creators, through: :game_creators
end
