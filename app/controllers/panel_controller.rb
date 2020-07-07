class PanelController < ApplicationController
  before_action :authenticate_user!
  before_action :set_creator
  before_action :set_blogs, if: -> { @creator }
  layout "application"

  def index
    @users = User.all#where.not(id: current_user.id)
    @comments_count = @creator.posts_comments.count + @creator.posts_anonymous_comments.count

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

  private

    def set_creator
      @creator = Creator.find_by(user_id: current_user.id)
    end

    def set_blogs
      @blogs = @creator.blogs
    end
  end

end
