class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy
  has_many :post_clips, dependent: :destroy

  scope :get_all_post_except_first_post, -> (category_id, post_id){includes(:user).where("category_id = ? and id not in (?)", category_id, post_id)}
  scope :post_related, -> (category_id){where("category_id = ?", category_id).limit(4)}

  scope :tags_of_post, -> (post_id){joins(:tags).select("tags.*").where("post_id = ?", post_id)}

  # mount_uploader :image, CkeditorPictureUploader
  mount_uploader :image, ImageUploader
end
