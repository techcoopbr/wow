class Game < ApplicationRecord
  has_many :game_developers
  has_many :game_publishers
  mount_uploader :photo, PhotoUploader

  def self.app_list_steam_api
    steam_powered = SteamPowered.new
    steam_powered.app_list
  end

  def self.app_details_steam_api(id)
    steam_powered_store = SteamPoweredStore.new(id)
    steam_powered_store.app_details
  end



  def self.new_steam_game(info)
    game = Game.new(name:               info['name'],
                    source_id:          info['steam_appid'],
                    description:        info['detailed_description'],
                    about:              info['about_the_game'],
                    short_description:  info['short_description'],
                    source:             'steam')

    game
  end

  def self.create_steam_game(info)
    game = Game.find_by(name: info['name'])

    if not game
      game = new_steam_game(info)
      game.save
    end

    if !info['developers'].nil?
      GameDeveloper.create_developer_relation(game, info['developers'])
    end

    if !info['publishers'].nil?
      GamePublisher.create_publisher_relation(game, info['publishers'])
    end
  end

  def self.is_game?(details)
    return false if details.nil?

    details['type'].eql?('game')
  end

  def self.steam_game_request
    app_list_steam_api.each do |g|

      app_details = app_details_steam_api(g['appid'])

      if is_game?(app_details)
        Game.create_steam_game(app_details)
      end


      sleep(1)
    end
  end

end
