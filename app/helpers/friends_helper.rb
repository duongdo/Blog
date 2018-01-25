module FriendsHelper
  def find_friendship user, friend
    @friendship_send = Friend.find_by(user_id: user, friend_id: friend)
    @friendship_take = Friend.find_by(friend_id: user, user_id: friend)

    if @friendship_send
      @friend_ship = @friendship_send.id

      if @friendship_send.status == 1
        @friend = t "friend"
      else
        @friend = t "sent_friend"
      end
    elsif @friendship_take
      @friend_ship = @friendship_take.id

      if @friendship_take.status == 1
        @friend = t "friend"
      else
        @friend = t "accept_friend"
      end
    else
      @friend = t "add_friend"
    end
  end
end
