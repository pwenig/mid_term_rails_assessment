class Comment < ActiveRecord::Base
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: { message: "Comment cannot be blank" }
  belongs_to :user

end

