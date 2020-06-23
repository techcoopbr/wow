class ImportController < ApplicationController
  def create
    Sidekiq.redis { |conn| conn.flushdb }

    SteamApiRequestJob.perform_now

    redirect_to panel_index_path
  end
end
