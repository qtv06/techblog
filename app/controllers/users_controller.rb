class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :count_post
  def show
    @posts = current_user.posts
  end
end
