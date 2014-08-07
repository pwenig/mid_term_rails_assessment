class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_id: params[:post_id], body: params[:comment][:body])
    if @comment.save
      redirect_to root_path
    else
      render :new
    end

  end

end