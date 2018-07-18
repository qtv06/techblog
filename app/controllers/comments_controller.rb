class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_comment, except: :create
  def create
    @comment = @post.comments.build comment_params
    @comment.user = current_user

    if @comment.save
      respond_to do |f|
        f.html{redirect_to post_path @post}
        f.js
      end
    else
      redirect_to post_path @post
    end
  end

  def update
    if @comment.update comment_params
      flash[:success] = "Saved comment"
    else
      flash[:danger] = "Some thing wrong"
    end

    respond_to do |f|
      f.html{redirect_to post_path @post}
      f.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |f|
      f.html{redirect_to post_path @post}
      f.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
    @post = Post.find_by id: params[:post_id]
    redirect_to root_path if @post.blank?
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
    redirect_to post_path @post if @comment.blank?
  end
end
