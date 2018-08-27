class User < ApplicationRecord
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :post_clips, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true

  scope :hot_author, -> {joins(:posts).select("users.*, count(posts.id) as count").group("users.id").order("count DESC").limit(3)}
  scope :number_post, -> (user_id){joins(:posts).where("users.id = ?", user_id).count}

  scope :number_clips, -> (user_id){joins(:post_clips).where("users.id = ?", user_id).count}

  scope :commented_at, -> (post_id){joins(:comments).where("post_id = ?", post_id)}

  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.email = auth_hash['info']['email']
      user.save!
      user
    end
  end
end
