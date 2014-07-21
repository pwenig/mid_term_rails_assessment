require 'rails_helper'

describe Comment do

  it "returns false if comment body is blank" do
    comment = Comment.new(body: "", user_id: 1, post_id: 1)
    expect(comment.valid?).to eq false
  end
end