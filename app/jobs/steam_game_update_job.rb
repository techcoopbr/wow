class SteamGameUpdateJob < ApplicationJob
  queue_as :steam_api

  include Steam

  def perform(id)
    begin
      app_details = Game.get_details(id)
      Game.create_or_update_steam_game(app_details) if Game.is_game?(app_details)
    rescue Steam::TooManyRequestsError
      sleep 60
      retry
    end

  end
end
