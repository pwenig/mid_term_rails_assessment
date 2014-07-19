class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:body).merge(user: current_user)
  end

end