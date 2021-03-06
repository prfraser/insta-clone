class CommentsController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

   def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:title)
    end
end