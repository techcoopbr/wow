class SteamApiRequestJob < ApplicationJob
  queue_as :steam_api

  def perform
    Game.steam_games_list.each do |g|
      SteamGameUpdateJob.perform_later(g['appid'])
    end
  end

end
