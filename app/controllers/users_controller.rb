class UsersController < ApplicationController
  before_action :find_user
  before_action :count_post

  def show
    @posts = @user.posts
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    redirect_to root_path if @user.blank?
  end
end
