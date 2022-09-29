class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  after_save :update_posts_count

  def update_posts_count
    user.increment!(:postsCounter)
  end

  def recents_comments
    comments.order(created_at: :desc).limit(5)
  end
end
