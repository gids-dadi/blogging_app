class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, class_name: 'Like', foreign_key: 'user_id'
  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'

  before_validation :default_values

  validates :name, presence: true
  # validates :photo, presence: true
  validates :postsCounter, numericality: {
    greater_than_or_equal_to: 0
  }

  def last_3_post
    posts.order(created_at: :desc)
  end

  private

  def default_values
    self.postsCounter = 0
    self.bio = 'I am a teacher'
    self.photo = 'https://img.myloview.com/posters/social-media-user-icon-default-avatar-profile-image-400-251200036.jpg'
  end
end
