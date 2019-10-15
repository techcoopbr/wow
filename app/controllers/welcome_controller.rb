class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "dashboard"

  def index
    @creators = Creator.where(approved: true)
  end

  def creator
    @creator = Creator.find_by(slug: params[:slug])
    if @creator.nil?
      redirect_to root_path
    end
  end
end
