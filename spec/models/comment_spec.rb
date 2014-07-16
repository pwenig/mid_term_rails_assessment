require 'rails_helper'

describe Comment do

  it 'validates presence of body' do

    # use new and not create to avoid creating record in database
    comment = Comment.new(comment: "foo")
    expect(comment).to have(0).errors_on(:comment)

    comment = Comment.new(comment: "")
    expect(comment).to have(1).errors_on(:comment)
  end
end