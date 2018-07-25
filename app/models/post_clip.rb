class PostClip < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :user_cliped, -> (post_id){joins(:user).select("`users`.*").where("post_id = ?", post_id)}

  scope :saved_by, -> (post_id, user_id){where("post_id = ? and user_id = ?", post_id, user_id)}
end
