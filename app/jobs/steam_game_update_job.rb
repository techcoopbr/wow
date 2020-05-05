class SteamGameUpdateJob < ApplicationJob
  queue_as :default

  def perform(games)
    games.each do |g|
      app_details = SteamGameUpdateJob.get_details(g['appid'])
      Game.create_or_update_steam_game(app_details) if Game.is_game?(app_details)
    end
  end

  private

    def self.get_details(id)
      begin
        steam_powered_store = SteamPoweredStore.new(id)
        res = steam_powered_store.app_details

        raise if res.code == 429
      rescue
        sleep(60)
        retry
      end

      res[id.to_s]['data']
    end

end
