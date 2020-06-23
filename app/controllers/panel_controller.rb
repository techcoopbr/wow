class PanelController < ApplicationController
  before_action :authenticate_user!
  layout "application"

  def index
    begin
      @creator = Creator.find_by!(user_id: current_user.id)
      @blogs = @creator.blogs

      @comments = Array.new
      @anonymous_comments = Array.new

      @blogs.each do |b|
        @comments += b.comments
        @anonymous_comments += b.anonymous_comments
      end
    rescue
      @creator = nil
      @blogs = nil
    end

    @users = User.all#where.not(id: current_user.id)
  end
end
