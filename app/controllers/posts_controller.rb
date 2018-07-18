class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %i(show destroy)
  before_action :count_post, only: :destroy
  def index
    if params[:search_field]
      @posts = Post.search params[:search_field]
      redirect_to posts_path && return
    else
      @posts = Post.includes(:comments)
      redirect_to root_path && return
    end
  end

  def show
    debugger
    @posts_related = Post.post_related @post.category_id
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      if params[:tag_ids]
        @tag_ids = params[:tag_ids]
        @tag_ids.each do |tag_id|
          @post.post_tags.build(tag_id: tag_id)
        end
      end
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    if @post.destroy
      @total_post = User.number_post(current_user.id)
      flash[:success] = "Deleted successful"
    else
      flash[:danger] = "Sometime is wrong..."
    end

    respond_to do |f|
      f.html{ redirect_to current_user}
      f.js
    end
  end
  private

  def post_params
    params.require(:post).permit(:title, :description, :content, :link, :category_id, :image, :tag_ids => [])
  end

  def find_post
    @post = Post.find_by id: params[:id]
    redirect_to current_user if @post.blank?
  end
end
