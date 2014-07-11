class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_attributes)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to root_path
    else
      p @comment.errors.full_messages
      flash[:notice] = "Invalid comment"
      render :new
    end

  end

  private
  def comment_attributes
      params.require(:comment).permit(:comment)
  end
end