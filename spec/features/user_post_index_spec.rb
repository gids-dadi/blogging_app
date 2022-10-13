require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Tom', bio: 'Software Developer', photo: 'http://hello.com/org.png', postsCounter: 0)

      @post = Post.create(title: 'first', text: 'first post', user_id: @user.id, commentsCounter: 0, likesCounter: 0)

      @post_one = Post.create(title: 'second', text: 'second post', user_id: @user.id, commentsCounter: 0,
                              likesCounter: 0)

      @post_two = Post.create(title: 'third', text: 'third post', user_id: @user.id, commentsCounter: 0,
                              likesCounter: 0)

      Comment.create(text: 'comment on second post', user_id: @user.id, post_id: @post_one.id)

      Comment.create(text: 'another comment on second post', user_id: @user.id, post_id: @post_one.id)

      Comment.create(text: 'comment on third post', user_id: @user.id, post_id: @post_two.id)

      Like.create(post_id: @post.id, user_id: @user.id)
      Like.create(post_id: @post_one.id, user_id: @user.id)
      Like.create(post_id: @post_two.id, user_id: @user.id)
    end

    it "I can see the user's username." do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Tom')
    end

    it "I can see the user's profile picture." do
      visit user_posts_path(@user.id)
      expect(page).to have_xpath("//img[contains(@src,'http://hello.com/org.png')]")
    end

    it 'I can see the number of posts each user has written.' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(3)
    end

    it "I can see the user's username." do
      visit user_posts_path(@user.id)
      expect(page).to have_content('first')
      expect(page).to have_content('second')
      expect(page).to have_content('third')
    end

    it "I can see some of the post's body." do
      visit user_posts_path(@user.id)
      expect(page).to have_content('first post')
      expect(page).to have_content('second post')
      expect(page).to have_content('third post')
    end

    it 'I can see how many comments a post has.' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Comments: 2')
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes a post has.' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Likes: 1')
    end

    it 'redirects to all user posts page' do
      visit user_posts_path(@user.id)
      click_link 'first'
      expect(page).to have_current_path user_post_path(@user.id, @post.id)
    end
  end
end
