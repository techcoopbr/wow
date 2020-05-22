module Steam
  class StoreClient
    include HTTParty
    base_uri 'store.steampowered.com'
    
    def initialize(appid)
      @options = { query: { appids: appid } }
    end
    
    def app_details
      self.class.get('/api/appdetails', @options)
    end
    
  end
end