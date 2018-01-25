class CommentsController < ApplicationController
  before_action :load_info_comment, only: [:edit, :destroy, :update, :show]

  def index
    @comments = Comment.load_comment(comments_params[:post_id])
      .page(params[:page]).per Settings.size
  end

  def show
    @comments = Comment.load_comment(@comment.post_id)
      .page(params[:page]).per Settings.size
  end

  def create
    @comment = current_user.comments.build comments_params
    if @comment.save
      @comments = Comment.load_comment(comments_params[:post_id])
        .page(params[:page]).per Settings.size
    end
  end

  def edit; end

  def update

    if @comment.update_attributes comments_params
      @comments = Comment.load_comment(comments_params[:post_id])
        .page(params[:page]).per Settings.size
    end
  end

  def destroy

    if @comment.destroy
      @comments = Comment.load_comment(@comment.post_id)
        .page(params[:page]).per Settings.size
    end
  end

  private

  def comments_params
    params.require(:comment).permit :post_id, :content
  end

  def load_info_comment
    @comment = Comment.find_by id: params[:id]
  end
end
