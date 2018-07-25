module TagsHelper
  def saved_post? post_id, user_id
    Tag.saved_by(post_id, user_id).present?
  end
end
