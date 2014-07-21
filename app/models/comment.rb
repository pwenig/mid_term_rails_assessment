class Comment < ActiveRecord::Base
  belongs_to :post

  validates :body, :presence => {:message => "Comment cannot be blank"}
end