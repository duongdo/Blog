class UsersController < ApplicationController
  def show
    @posts = Post.load_info.where(user_id: params[:id])
  end
end
