class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @posts = current_user.posts
    number_post = User.number_post current_user.id
  end
end
