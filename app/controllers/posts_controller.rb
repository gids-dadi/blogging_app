class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    post = Post.new(params.require(:post).permit(:title, :text))
    post.user_id = @user.id

    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_posts_path(@user)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
