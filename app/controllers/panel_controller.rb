class PanelController < ApplicationController
  before_action :authenticate_user!
  layout "application"

  def index
    @creator = Creator.find_by(user_id: current_user.id)
  end
end
