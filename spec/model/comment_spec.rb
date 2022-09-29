require 'rails_helper'

RSpec.describe Comment, type: :model do
  comment = Comment.new(user_id: 2, id: 3, text: 'I like your new feature')

  before { comment.save }

  it 'is valid with valid attributes' do
    expect(comment).to_not be_valid
  end

  it 'is not valid without an user_id' do
    comment.user_id = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without a post_id' do
    comment.id = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without a text' do
    comment.text = nil
    expect(comment).to_not be_valid
  end
end