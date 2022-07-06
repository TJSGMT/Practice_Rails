class CommentsController < ApplicationController
  def create
    #create a new comment
    #for the post from the current_user
    # @comment = Comment.create(comment_params)
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "successfully added Comment"
    end

    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    # params.require(:comment).permit(:context, :post_id, :user_id)
    params.require(:comment).permit(:context).merge(post_id: params[:post_id])
  end
end
