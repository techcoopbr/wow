class PerfilController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "perfil"

  def index
    @creator = Creator.find_by(slug: params[:slug])
    if @creator.nil?
      redirect_to root_path
    end
  end
end
