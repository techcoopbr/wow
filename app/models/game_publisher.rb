class GamePublisher < ApplicationRecord
  belongs_to :game
  belongs_to :publisher

  def self.existent_relation?(game, publisher)
    GamePublisher.where(game: game, publisher: publisher).exists?
  end

  def self.create_publisher_relation(game, info)
    info.each do |pub_name|
      pub = Publisher.get_steam_publisher(pub_name)

      if not GamePublisher.existent_relation?(game, pub)
        GamePublisher.new(game: game, publisher: pub).save
      end

    end
  end
end
