class LikesController < ApplicationController
  def create
    @user = current_user.id
    @post = params[:format]
    @current_post = Post.find_by id: @post
    @new_like = Like.find_by user_id: @user, post_id: @post
    if !@new_like
      @new_like = Like.new user_id: @user, post_id: @post
      @new_like.save
      @temp = true
    else
      @new_like.destroy
      @temp = false
    end
    return @temp
  end
end
