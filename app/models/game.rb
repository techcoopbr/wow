class Game < ApplicationRecord
  has_many :game_developers
  has_many :game_publishers
  mount_uploader :photo, PhotoUploader

  def add_developers(info_hash)
    GameDeveloper.create_developer_relation(self, info_hash['developers'])
  end

  def add_publisher(info_hash)
    GamePublisher.create_publisher_relation(self, info_hash['publishers'])
  end

  def set_steam_attributes(info_hash)
    self.name =               info_hash['name']
    self.source_id =          info_hash['steam_appid']
    self.description =        info_hash['detailed_description']
    self.about =              info_hash['about_the_game']
    self.short_description =  info_hash['short_description']
    self.source =             'steam'
    self.add_developers(info_hash)
    self.add_publisher(info_hash)
  end

  def self.create_or_update_steam_game(info_hash)
    game = Game.find_by(name: info_hash['name'])

    game = Game.new if game.nil?

    game.set_steam_attributes(info_hash)
    
    game.save
  end

  def self.is_game?(info_hash)
    return false if info_hash.nil?
    info_hash['type'].eql?('game')
  end

  def self.steam_game_request
    SteamApiRequestJob.perform_later
  end

end
