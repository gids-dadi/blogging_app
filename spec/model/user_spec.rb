require 'rails_helper'

RSpec.describe User,  type: :model do
 user  = User.new(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'he was born in 1990 in England', postsCounter: 15)
  
before { user.save}

  it 'is valid with complete attributes' do
    expect(user).to be_valid
  end

    it 'is not valid without a posts counter' do
    user.postsCounter = nil
    expect(user).to_not be_valid
  end

      it 'is not valid with posts counter less than 0' do
    user.postsCounter = -1
    expect(user).to_not be_valid
  end
 it 'has last_3_posts method with 3 posts' do
  expect(user.last_3_post.count).to_not eq(2)
 end
end