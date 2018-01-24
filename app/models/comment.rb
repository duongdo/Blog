class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :load_comment, ->id{select(:user_id, :post_id, :content, :created_at)
    .includes(:user).where(post_id: id).order created_at: :desc}
end
