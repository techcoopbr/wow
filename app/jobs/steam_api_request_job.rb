class SteamApiRequestJob < ApplicationJob
  queue_as :default

  def perform

    for count in 1..10
      steam_powered = SteamPowered.new
      res = steam_powered.app_list
      break if res.code == 200
      sleep(60)
    end

    SteamGameUpdateJob.perform_later(res['applist']['apps'])
  end

end
