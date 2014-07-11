require "rails_helper"

describe PostsController do
  describe "POST create" do
    it "assigns a post variable" do
      post :create, body: ""

      expect(Post.all.count).to eq 1
    end
  end
end