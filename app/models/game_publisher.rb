class GamePublisher < ApplicationRecord
  belongs_to :game
  belongs_to :publisher

  def self.existent_relation?(game, publisher)
    GamePublisher.where(game: game, publisher: publisher).exists?
  end

  def self.create_publisher_relation(game, info)
    return if info.nil?
    info.each do |pub_name|
      pub = Publisher.get_or_create_steam_publisher(pub_name)
      GamePublisher.new(game: game, publisher: pub).save if not GamePublisher.existent_relation?(game, pub)
    end
  end
end
