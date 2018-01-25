class FriendsController < ApplicationController
  def create
    @user = current_user.id
    @friend_id = params[:friend_id]
    @new_friend = Friend.new user_id: @user, friend_id: @friend_id, status: false
    if @new_friend.save
      flash[:info] = t "wait_request"
      @post = Post.includes(:user).find_by(id: params[:post_id])
      find_friendship current_user.id, @friend_id
    end
  end

  def update
    @user = current_user.id
    @friend_id = params[:friend_id]
    @friendship_take = Friend.find_by(friend_id: @user, user_id: @friend_id)

    if @friendship_take.update_attributes status: true
      @post = Post.includes(:user).find_by(id: params[:post_id])
      find_friendship current_user.id, @friend_id
    end
  end

  def destroy
    @user = current_user.id
    @friend_id = params[:friend_id]
    @friendship_send = Friend.find_by(user_id: @user, friend_id: @friend_id)
    @friendship_take = Friend.find_by(friend_id: @user, user_id: @friend_id)

    if @friendship_send || @friendship_take
      @post = Post.includes(:user).find_by(id: params[:post_id])
      if @friendship_send.destroy
      elsif @friendship_take.destroy
      end
      find_friendship current_user.id, @friend_id
    end
  end
end
