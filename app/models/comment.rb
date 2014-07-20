class Comment < ActiveRecord::Base
belongs_to :user
  validates :body, :presence => {:message => "Comment cannot be blank"}
end