json.array! @notifications do |notification|
  json.id notification.id
  json.recipient_username notification.recipient.username
  json.recipient notification.recipient
  json.actor notification.actor.username
  json.action notification.action
  json.time notification.created_at
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize}"
    json.post_name "on #{notification.notifiable.post.title}"
  end
  json.url post_path(notification.notifiable.post, anchor: dom_id(notification.notifiable))
end
