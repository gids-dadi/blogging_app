require 'rails_helper'
RSpec.describe 'Post', type: :feature do
  describe 'show page' do

    before(:each) do

      @user = User.create(name: 'Tom', bio: 'Software Developer', photo: 'http://hello.com/org.png', postsCounter: 0)

      @post = Post.create(title: 'first', text: 'first post', user_id: @user.id, commentsCounter: 0, likesCounter: 0)

        @post_one = Post.create(title: 'second', text: 'second post', user_id: @user.id, commentsCounter: 0, likesCounter: 0)

        @post_two = Post.create(title: 'third', text: 'third post', user_id: @user.id, commentsCounter: 0, likesCounter: 0)

        Comment.create(text: 'comment on second post', user_id: @user.id, post_id: @post_one.id)

        Comment.create(text: 'another comment on second post', user_id: @user.id, post_id: @post_one.id)

          Comment.create(text: 'comment on third post', user_id: @user.id, post_id: @post_two.id)

        Like.create(post_id: @post.id, user_id: @user.id)
      Like.create(post_id: @post_one.id, user_id: @user.id)
      Like.create(post_id: @post_two.id, user_id: @user.id)        
    end

    it 'I can see who wrote the post.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('Tom')
    end

    it "I can see the post's title." do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('first')
    end


    it 'I can see the post body.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('first post')
    end

     it 'I can see how many comments a post has.' do
      visit user_post_path(@user.id, @post_two.id)
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes it has.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('Likes: 1')
    end

    it 'I can see the username of each commentor.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('Tom')
    end

    it 'I can see the comment each commentor left.' do
      visit user_post_path(@user.id, @post_one.id)
      expect(page).to have_content('comment on second post')
    end
  end
end