class PerfilController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "perfil"

  has_scope :search

  def index
    @creator = Creator.find_by(slug: params[:slug])
    if @creator.nil?
      redirect_to root_path
    end
  end

  def result
    param_txt = '%' + params[:search] + '%'
    @creators = Creator.where("page_name ilike ? or slug ilike ? or about ilike ?", param_txt, param_txt, param_txt)

  end

  def home
    @creators = Creator.where(approved: true).order("RANDOM()")
    @creators = @creators.first(6)
    @blogs = Blog.where(admin_published: true, creator_published: true).order("RANDOM()")
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
  rescue
    redirect_to panel_path
  end
  end
end
