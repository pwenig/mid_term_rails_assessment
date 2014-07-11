require "rails_helper"

describe Post do
  it "should respond to comment" do
    @post = Post.new
    expect(@post).to respond_to(:comments)
  end
end