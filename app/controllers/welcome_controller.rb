class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "dashboard"

  def index

  end
end
