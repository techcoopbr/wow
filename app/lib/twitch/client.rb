module Twitch
  class Client
    include HTTParty
    base_uri 'api.twitch.tv'

    def initialize
      @options = { headers: { Authorization: "Bearer #{get_token}", "Client-ID" => ENV['TWITCH_CLIENT_ID'] } }
    end

    def get_stream_by_login(login)
      options = @options
      options[:query] = { user_login: login }
      self.class.get("/helix/streams", options)
    end

    private

      def get_token
        query = { query: {  client_id: ENV['TWITCH_CLIENT_ID'],
                            client_secret: ENV['TWITCH_SECRET'],
                            grant_type: 'client_credentials' } }
        HTTParty.post("https://id.twitch.tv/oauth2/token", query).parsed_response['access_token']
      end
  end
end