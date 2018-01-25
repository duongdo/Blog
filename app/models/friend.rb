class Friend < ApplicationRecord
  belongs_to :user

  scope :user_id_friend, ->id{where(user_id: id, status: true)}
  scope :friend_id_friend, ->id{where(friend_id: id, status: true)}
end
