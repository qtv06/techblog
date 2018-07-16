class PostsController < ApplicationController
  def index
    if params[:search_field]
      @posts = Post.search params[:search_field]
      redirect_to posts_path && return
    else
      @posts = Post.all
      redirect_to root_path && return
    end
  end

  def show
  end
end
