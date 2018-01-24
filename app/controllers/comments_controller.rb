class CommentsController < ApplicationController
  def index
    @comments = Comment.load_comment(comments_params[:post_id])
      .page(params[:page]).per Settings.size
  end

  def create
    @comment = current_user.comments.build comments_params
    if @comment.save
      @comments = Comment.load_comment(comments_params[:post_id])
        .page(params[:page]).per Settings.size
    end
  end

  private

  def comments_params
    params.require(:comment).permit :post_id, :content
  end
end
