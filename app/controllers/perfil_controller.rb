class PerfilController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "perfil"
  impressionist actions: [:post, :blog, :index]

  before_action :set_ransack_params

  has_scope :search
  respond_to :html, :json
  has_scope :page, default: 1

  def index
    if params[:slug] != 'sidekiq'
      @creator = Creator.find_by(slug: params[:slug])
      if @creator.nil?
        redirect_to root_path
      end
      begin
        impressionist @creator
      rescue
      end
    else
      redirect_to sidekiq_web_path
    end

    unless @creator.twitter.nil?
      begin
        if @creator.twitter.include? "/"
          @creator.twitter = @creator.twitter.partition('twitter.com/').last
        end

        @client = TwitterRestClient.new_client
        @tweets = @client.user_timeline(@creator.twitter, exclude_replies: true, count: Twitter::REST::Tweets::MAX_TWEETS_PER_REQUEST)
      rescue

      end
    end
  end

  def games
    @creators = @q.result
#    @blogs = @b.result
  end

  def result
    @creators = @q.result
#    @blogs = @b.result
  end

  def home
    @creators = Creator.where(approved: true).where.not(photo: nil).order("RANDOM()")
    @creators = @creators.first(6)
    @blogs = Blog.where(admin_published: true, creator_published: true).order("RANDOM()")
  end

  def blog
    @creator = Creator.find_by(slug: params[:slug])
    if @creator.nil?
      @blogs = Blog.where(admin_published: true, creator_published: true).order(created_at: :desc)
    else
      begin
        impressionist @creator
      rescue

      end
      @blogs = Blog.where(creator_id: @creator.id, admin_published: true, creator_published: true).order(created_at: :desc)
    end
    @q= @blogs.ransack(title_or_body_cont: params[:search])
    @blogs = @q.result

    @blogs = @blogs.page(params[:page]).per(5)
  end

  def post
  #  begin
      @creator = Creator.find_by(slug: params[:creator])
      @blog    = Blog.find_by(slug: params[:slug], admin_published: true, creator_published: true)
      @comments = Comment.where(blog_id: @blog.id)
      @newcomment = Comment.new

      if @blog.nil? && @creator != nil
        begin
          @blog  = Blog.find(slug: params[:slug], creator_id: current_user.creator.id)
        rescue
          redirect_to panel_path
        end
      else
        if @blog.views.nil?
          @blog.views = 1
        else
          @blog.views = @blog.views + 1
        end
        @blog.save!
      end
      begin
        impressionist @blog
      rescue
  #    redirect_to panel_path
      end
  end

  private

    def set_ransack_params
      @q = Creator.ransack(page_name_or_slug_or_about_cont: params[:search])
#      @b = Blog.ransack(title_or_body_cont: params[:search])
    end
end
