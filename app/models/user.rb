class User < ApplicationRecord
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true

  scope :hot_author, -> {joins(:posts).select("users.*, count(posts.id) as count").group("users.id").order("count DESC").limit(3)}
end
