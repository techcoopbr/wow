class Game < ApplicationRecord
  validates :name, uniqueness: true
  has_many :game_developers
  has_many :game_publishers
  has_many :followers, class_name: GameFollow, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  include Steam

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

  def self.steam_games_list
    Steam::Client.new.app_list['applist']['apps']
  end

  def self.get_details(id)
    client = Steam::StoreClient.new(id)
    response = client.app_details

    raise Steam::NilResponseError.new if response.nil?

    raise Steam::TooManyRequestsError.new if response.code == 429

    response[id.to_s]['data']
  end

  def add_developers(info_hash)
    GameDeveloper.create_developer_relation(self, info_hash['developers'])
  end

  def add_publishers(info_hash)
    GamePublisher.create_publisher_relation(self, info_hash['publishers'])
  end

  def set_steam_attributes(info_hash)
    self.name               = info_hash['name']
    self.source_id          = info_hash['steam_appid']
    self.description        = info_hash['detailed_description']
    self.about              = info_hash['about_the_game']
    self.short_description  = info_hash['short_description']
    self.photo              = info_hash['header_image']
    self.source             = 'steam'
    self.add_developers(info_hash)
    self.add_publishers(info_hash)
  end

end
