class Api::CommentsController < Api::BaseController

  def create
    @comment = Comment.new(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      render :show
    else
      return :unprocessed_entity
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :topic_id)
  end
end
