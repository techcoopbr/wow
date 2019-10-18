class GameCreator < ApplicationRecord
  belongs_to :game
  belongs_to :creator
end
