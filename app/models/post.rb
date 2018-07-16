class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  default_scope -> {order created_at: :desc}
  scope :get_all_post_exept_first_post, -> (category_id, post_id){references(:users).where("category_id = ? and id not in (?)", category_id, post_id)}
  scope :search, -> (search_text){where("title like ? or description like ?", "%#{search_text}%", "%#{search_text}%")}
end
