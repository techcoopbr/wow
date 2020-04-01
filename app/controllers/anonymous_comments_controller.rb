class AnonymousCommentsController < ApplicationController
  skip_before_filter :authenticate_user!

  def create
    @blog = Blog.find_by!(slug: params[:blog_id])

    @anonymous_comment = AnonymousComment.new(anonymous_comment_params)
    @anonymous_comment.blog = @blog

    @anonymous_comment.save

    redirect_to public_post_path(@blog)

  end

  def destroy
    @blog = Blog.find_by!(slug: params[:blog_id])
    
    @anonymous_comment = @blog.anonymous_comments.find(params[:id])

    authorize @anonymous_comment

    @anonymous_comment.destroy

    redirect_to public_post_path(@blog)
  end


  private

    def anonymous_comment_params
      params.require(:anonymous_comment).permit!
    end

end
