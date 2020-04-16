class SteamPoweredStore
  include HTTParty
  base_uri 'store.steampowered.com'
  
  def initialize(appid)
    @options = { query: { appids: appid } }
    @appid = appid.to_s
  end
  
  def app_details
    self.class.get('/api/appdetails', @options)[@appid]['data']
  end
  
end