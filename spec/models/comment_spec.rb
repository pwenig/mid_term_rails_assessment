require 'rails_helper'

describe 'Comment' do
  it "creates a comment for a post" do
    user = create_user
    post = Post.new(user: user, body: "Digging into some clojure.  Learning to love the parenthesis.")
    comment = Comment.new(post_id: post.id, body: "I love this post")
    expect(comment.valid?).to eq true
  end

  it "cannot creates a comment for a post without a comment" do
    user = create_user2
    post = Post.new(user: user, body: "Digging into some clojure.  Learning to love the parenthesis.")
    comment = Comment.new(post_id: post.id, body: "")
    expect(comment.valid?).to eq false
  end

end
