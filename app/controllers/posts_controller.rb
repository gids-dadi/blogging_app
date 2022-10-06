class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user).where(user_id: params[:user_id]).references(:posts)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
end
