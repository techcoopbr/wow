class TwitchController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "perfil"

  before_action :set_streamers

  include Twitch

  def live
    @lives = get_lives
  end

  private
    def set_streamers
      @streamers = Creator.streamers
    end

    def get_lives
      Twitch::Client.new.get_stream_by_login(Creator.get_twitch_logins).parsed_response['data']
    end
end
