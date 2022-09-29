require 'rails_helper'

RSpec.describe Post, type: :model do
  post = Post.new(user_id: 1, title: 'Hello', text: 'This is me saying hello', commentsCounter: 7, likesCounter: 12)

  before { post.save }

  it 'is valid with complete attributes' do
    expect(post).to_not be_valid
  end

  it 'is not valid without user_id' do
    post.user_id = nil
    expect(post).to_not be_valid
  end

  it 'it is not valid without a comments counter' do
    post.commentsCounter = nil
    expect(post).to_not be_valid
  end

  it 'it is not valid without a likes counter' do
    post.likesCounter = nil
    expect(post).to_not be_valid
  end

  it 'it is not valid with a comments counter less 0' do
    post.commentsCounter = - 1
    expect(post).to_not be_valid
  end

  it 'it is not valid with a likescounter less 0' do
    post.likesCounter = - 1
    expect(post).to_not be_valid
  end

  it 'it is not valid without a text' do
    post.text = nil
    expect(post).to_not be_valid
  end
end
