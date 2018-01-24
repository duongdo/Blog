class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :users_comment, through: :comments, class_name: :User
  has_many :users_like, through: :likes, class_name: :User

  scope :load_info,->{select(:title, :created_at, :user_id, :id).includes(:user)
    .order updated_at: :desc}
end
