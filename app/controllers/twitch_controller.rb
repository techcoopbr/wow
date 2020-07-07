class TwitchController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "perfil"

  before_action :set_streamers
  before_action :set_lives

  include Twitch

  def live

  end

  def get_lives
    respond_to do |format|
      format.json { render json: @lives }
    end
  end

  private
    def set_streamers
      @streamers = Creator.streamers
    end

    def set_lives
      @lives = Twitch::Client.new.get_stream_by_login(Creator.get_twitch_logins).parsed_response['data']
    end
end
