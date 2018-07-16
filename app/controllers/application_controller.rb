class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :setup

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
