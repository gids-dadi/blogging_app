class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    comment = Comment.new(params.require(:comment).permit(:text))
    comment.user_id = @user.id
    comment.post_id = @post.id
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment saved successfully'
          redirect_to user_post_path(@user, @post)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
          render :new, locals: { comment: }
        end
      end
    end
  end

 def destroy
    post = Post.find(params[:post_id])
    Comment.destroy(params[:id])
    post.commentsCounter -= 1
    post.save
    redirect_to user_posts_path(current_user.id)
  end


  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
