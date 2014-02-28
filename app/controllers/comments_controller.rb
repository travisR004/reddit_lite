class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.link_id = params[:link_id]

    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to link_url(@comment.link_id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :parent_comment_id)
  end
end
