class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments
  end
end
