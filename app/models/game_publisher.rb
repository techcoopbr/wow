class GamePublisher < ApplicationRecord
  validates :game_id, uniqueness: { scope: [:publisher_id] }
  belongs_to :game
  belongs_to :publisher

  def self.create_publisher_relation(game, info)
    return if info.nil?
    info.each do |pub_name|
      pub = Publisher.get_or_create_steam_publisher(pub_name)
      gp = GamePublisher.new(game: game, publisher: pub)
      gp.save if gp.valid?
    end
  end
end
