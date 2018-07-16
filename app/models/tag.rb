class Tag < ApplicationRecord
  has_many :post_tags
  has_many :posts, through: :post_tags

  scope :get_count, -> {joins("left join post_tags on tags.id = post_tags.tag_id").select("tags.*, count(post_tags.id) as count").group('tags.id')}
end
