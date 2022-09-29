class User < ApplicationRecord
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'
  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'

  validates :name, presence: true
  # validates :photo, presence: true
  validates :postsCounter, numericality: {
    greater_than_or_equal_to: 0 }

  def last_3_post
    posts.order(created_at: :desc)
  end
end
