class PanelController < ApplicationController
  before_action :authenticate_user!
  before_action :set_creator
  before_action :set_blogs, if: -> { @creator }
  before_action :set_comments, if: -> { @blogs }
  layout "application"

  def index
    @users = User.all#where.not(id: current_user.id)
  end

  private

    def set_creator
      @creator = Creator.find_by(user_id: current_user.id)
    end

    def set_blogs
      @blogs = @creator.blogs
    end

    def set_comments
      @comments = Array.new
      @anonymous_comments = Array.new

      @blogs.each do |b|
        @comments += b.comments
        @anonymous_comments += b.anonymous_comments
      end
    end

end
