class UsersController < ApplicationController
  def show
    if params[:id]
      @posts = current_user
  end
end
