class User < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/avatar/default_img.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  has_many :comments
  has_many :likes
  has_many :posts
  has_many :posts_comment, through: :comments, class_name: :Post
  has_many :posts_like, through: :likes, class_name: :Post
end
