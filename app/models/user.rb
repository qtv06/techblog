class User < ApplicationRecord
  has_many :posts
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true

  scope :hot_author, -> {joins(:posts).select("users.*, count(posts.id) as count").group("users.id").order("count DESC").limit(3)}
  scope :number_post, -> (user_id){joins(:posts).where("users.id = ?", user_id).count}
end
