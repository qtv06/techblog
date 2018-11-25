class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :setup
  before_action :search_post

  def count_post
    @total_post = User.number_post(@user.id)
  end

  def authenticate_user!
    redirect_to new_user_session_path if current_user.blank?
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

  def search_post
    @q = Post.search params[:q]
  end
end
