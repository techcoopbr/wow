class ControlUserController < ApplicationController

  def index
    @control_users = User.all.order(id: :desc)
  end
end
