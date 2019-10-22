class PerfilController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "perfil"

  def index
    @creator = Creator.find_by(slug: params[:slug])
    if @creator.nil?
      redirect_to root_path
    end
  end

  def blog
    @creator = Creator.find_by(slug: params[:slug])
    if @creator.nil?
      @blogs = Blog.where(admin_published: true, creator_published: true).order(created_at: :desc)
    else
      @blogs = Blog.where(creator_id: @creator.id, admin_published: true, creator_published: true).order(created_at: :desc)
    end
  end

  def post
    begin
      @creator = Creator.find_by(slug: params[:creator])
      @blog    = Blog.find_by(slug: params[:slug], admin_published: true, creator_published: true)

      if @blog.nil?
        begin
          @blog  = Blog.find(slug: params[:slug], creator_id: current_user.creator.id)
        rescue
          redirect_to public_blog_path
        end
      end
    rescue
      redirect_to public_blog_path
    end
  end
end
