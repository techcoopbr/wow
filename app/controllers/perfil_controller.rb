class PerfilController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "perfil"
  impressionist actions: [:post, :blog, :index]

  has_scope :search

  def index
    if params[:slug] != 'sidekiq'
      @creator = Creator.find_by(slug: params[:slug])
      if @creator.nil?
        redirect_to root_path
      end
      impressionist @creator
    else
      redirect_to sidekiq_web_path
    end
  end

  def result
    @q = Creator.ransack(params[:q])
    @creators = @q.result
  end

  def home
    @creators = Creator.where(approved: true).where.not(photo: nil).order("RANDOM()")
    @creators = @creators.first(6)
    @blogs = Blog.where(admin_published: true, creator_published: true).order("RANDOM()")
    @q = Creator.ransack(params[:q])
  end

  def blog
    @creator = Creator.find_by(slug: params[:slug])
    if @creator.nil?
      @blogs = Blog.where(admin_published: true, creator_published: true).order(created_at: :desc)
    else
      impressionist @creator
      @blogs = Blog.where(creator_id: @creator.id, admin_published: true, creator_published: true).order(created_at: :desc)
    end
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
      impressionist @blog
  #  rescue
  #    redirect_to panel_path
  #  end
  end
end
