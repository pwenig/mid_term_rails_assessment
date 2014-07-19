require 'rails_helper'

describe Comment do

  it "adds a comment to a post" do
    comment = Comment.new(user_id: 1, post_id: 1, body: "Great post")
    expect(comment.valid?).to eq true
  end
end