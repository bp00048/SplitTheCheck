class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end
    redirect_to restaurant_path(params[:restaurant_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(restaurant_id: params[:restaurant_id])
  end
end
