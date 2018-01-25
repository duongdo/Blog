class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :users_comment, through: :comments, class_name: :User
  has_many :users_like, through: :likes, class_name: :User

  scope :load_info, ->{select(:title, :created_at, :user_id, :id).includes(:user)
    .order updated_at: :desc}
  scope :load_friend_post, ->a{select(:title, :created_at, :user_id, :id)
    .includes(:user).where(user_id: a).order updated_at: :desc}
  validates :title, presence: true
  validates :content, presence: true
end
