class Game < ApplicationRecord

  def self.app_list_steam_api
    HTTParty.get(ENV['APP_LIST_STEAM_API_URL']).parsed_response['applist']['apps']
  end

  def self.app_details_steam_api(id)
    HTTParty.get(ENV['APP_DETAIL_STEAM_API_URL'] + id.to_s).parsed_response[id.to_s]['data']
  end

  def self.new_steam_game(info_hash)
    game = Game.new(name:               info_hash['name'],
                    source_id:          info_hash['steam_appid'],
                    description:        info_hash['detailed_description'],
                    about:              info_hash['about_the_game'],
                    short_description:  info_hash['short_description'],
                    source:             'steam')

    if info_hash['developers']
      info_hash['developers'].each do |dev|
        game.developers ? game.developers += ", #{dev}" : game.developers = dev
      end
    end

    if info_hash['publishers']
      info_hash['publishers'].each do |pub|  
        game.publishers ? game.publishers += ", #{pub}" : game.publishers = pub
      end
    end
    
    game
  end

  def self.steam_game_request
    app_list_steam_api.each do |g|

      if !Game.find_by(name: g['name'])

        app_details = app_details_steam_api(g['appid'])

        if app_details
          new_steam_game(app_details).save if app_details['type'].eql?('game')
        end

        sleep(1.3)

      end
    end
  end

end
