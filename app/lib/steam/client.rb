module Steam
  class Client
    include HTTParty
    base_uri 'api.steampowered.com'
    
    def initialize
      @options = { query: { key: ENV['STEAM_API_KEY'] } }
    end

    def app_list
      self.class.get('/ISteamApps/GetAppList/v0002/', @options)
    end
    
  end
end