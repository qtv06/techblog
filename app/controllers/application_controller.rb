class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :setup

  def count_post
    @total_post = User.number_post(@user.id)
  end

  protected

  def setup
    @categories = Category.eager_load(:posts).references(:users)
    @tags = Tag.get_count
    @users = User.hot_author
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
