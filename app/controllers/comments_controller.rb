class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_attributes)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def comment_attributes
    params.require(:comment).permit(:body)
  end
end