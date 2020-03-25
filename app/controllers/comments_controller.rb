class CommentsController < ApplicationController

  def create
    @blog = Blog.find_by!(slug: params[:blog_id])

    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.blog = @blog

    @comment.save

    redirect_to public_post_path(@blog)
  end

  def destroy
    @blog = Blog.find_by!(slug: params[:blog_id])
    
    @comment = @blog.comments.find(params[:id])

    authorize @comment

    @comment.destroy

    redirect_to public_post_path(@blog)
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :commentary)
  end

end
