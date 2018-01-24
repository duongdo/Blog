class PostsController < ApplicationController
  def index
    @posts = Post.load_info
  end

  def show
    @post = Post.includes(:user).find_by(id: params[:id])

    if @post
      @comments = Comment.load_comment(params[:id]).page(params[:page]).per Settings.size
      @comment = current_user.comments.build if user_signed_in?
    else
      flash[:success] = t "post_error"
      redirect_to root_path
    end
  end

  def new
    @post = current_user.posts.build if user_signed_in?
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = t "post_success"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :content
  end
end
