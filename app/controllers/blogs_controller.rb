class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    if params[:tag]
      @blogs = Blog.tagged_with(params[:tag])
    else
      @blogs = Blog.all.order(created_at: :desc)
    end

    if current_user.creator?
      @blogs = @blogs.where(creator_id: current_user.creator.id).order(created_at: :desc)
    end
    authorize @blogs
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.friendly.find(params[:id])
    authorize @blog
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    authorize @blog
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.friendly.find(params[:id])
    authorize @blog
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    
    # if removido pois se o usuario nao é criador entao nao poderia estar criando um post
    # adicionar essa verificacao nas policies
    # esse bloco if nao esta permitindo passar o id do creator
    # if current_user.creator?
    @blog.creator_id = current_user.creator.id
    # end
    
    @blog.admin_published = true

    respond_to do |format|
      if @blog.save
        #format.js # Will search for create.js.erb
        format.html { redirect_to @blog, notice: 'Artigo criado com sucesso' }
        format.json { render :show, status: :created, location: @blog }
      else
        #format.html { render root_path }
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Artigo atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Artigo deletado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit!
    end
end
