class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_up_notifications, receipt: :index

  def index
  end

  def make_as_read
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

  def read_all
    @notifications = Notification.joins(:recipient).where(recipient: current_user).reverse
    render template: "/notifications/read_all"
  end

  private

  def set_up_notifications
    @notifications = Notification.joins(:recipient).where(recipient: current_user).unread
  end
end
