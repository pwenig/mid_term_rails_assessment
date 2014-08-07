class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :body, :message => "Comment cannot be blank"
end