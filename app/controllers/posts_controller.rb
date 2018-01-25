class PostsController < ApplicationController
  def index
    @posts = Post.load_info.page(params[:page]).per Settings.size
    if user_signed_in?
      @friend_id = Friend.user_id_friend(current_user.id)
        .or(Friend.friend_id_friend(current_user.id))
      friend_id_arr = []
      @friend_id.each do |x|

        if x.user_id != current_user.id
          friend_id_arr.push(x.user_id)
        elsif x.friend_id != current_user.id
          friend_id_arr.push(x.friend_id)
        end
      end
      @posts_friend = Post.load_friend_post(friend_id_arr).page(params[:page]).per Settings.size
    end
  end

  def show
    @post = Post.includes(:user).find_by(id: params[:id])

    if @post
      if user_signed_in?
        find_friendship current_user.id, @post.user.id
      end
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
