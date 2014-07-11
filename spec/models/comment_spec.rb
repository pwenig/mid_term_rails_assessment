require "rails_helper"


describe Comment do

  describe "validations" do
    let(:valid_attributes) {
      {
        user_id: 1,
        post_id: 1,
        comment: "this is a comment"
      }
    }
    it "can be valid" do
      expect(Comment.create!(valid_attributes).valid?).to eq true
    end

    it "isnt valid without post id" do
      valid_attributes.delete(:post_id)
      expect(Comment.new(valid_attributes).valid?).to eq false
    end

    it "isnt valid without user_id" do
      valid_attributes.delete(:user_id)
      expect(Comment.new(valid_attributes).valid?).to eq false
    end

    it "isnt valid without comment" do
      valid_attributes.delete(:comment)
      @comment = Comment.new(valid_attributes)
      expect(@comment.valid?).to eq false

      expect(@comment.errors[:comment]).to eq ["Comment cannot be blank"]
    end
  end
end